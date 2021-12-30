import 'package:dio/dio.dart';
import 'package:user_repo/core/infrastructure/extensions/dio_extensions.dart';
import 'package:user_repo/core/infrastructure/network_exceptions.dart';
import 'package:user_repo/core/infrastructure/remote_response.dart';
import 'package:user_repo/github/core/infrastructure/github_headers.dart';
import 'package:user_repo/github/core/infrastructure/github_headers_cache.dart';

class GithubRepoDetailRemoteService {
  final Dio _dio;
  final GithubHeadersCache _headersCache;

  GithubRepoDetailRemoteService(this._dio, this._headersCache);

  Future<RemoteResponse<String>> getReadmeHtml(String fullRepoName) async {
    try {
      final requestUri = Uri(
        scheme: 'https',
        host: 'api.github.com',
        path: '/repos/$fullRepoName/readme',
      );
      final previousHeaders = await _headersCache.getHeaders(requestUri);
      final response = await _dio.getUri<dynamic>(
        requestUri,
        options: Options(
          headers: <String, String>{
            'If-None-Match': previousHeaders?.etag ?? '',
          },
          responseType: ResponseType.plain,
        ),
      );

      if (response.statusCode == 304) {
        return const RemoteResponse.notModified(maxPage: 0);
      } else if (response.statusCode == 200) {
        final newHeaders = GithubHeaders.parse(response);
        await _headersCache.saveHeaders(requestUri, newHeaders);

        final html = response.data as String;
        return RemoteResponse.withNewData(html, maxPage: 0);
      } else {
        throw RestApiException(response.statusCode);
      }
    } on DioError catch (error) {
      if (error.isConnectionError) {
        return const RemoteResponse.noConnection();
      }

      rethrow;
    }
  }
}
