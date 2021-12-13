import 'package:dio/dio.dart';
import 'package:user_repo/core/infrastructure/extensions/dio_extensions.dart';
import 'package:user_repo/core/infrastructure/network_exceptions.dart';
import 'package:user_repo/core/infrastructure/remote_response.dart';
import 'package:user_repo/github/core/infrastructure/github_headers.dart';
import 'package:user_repo/github/core/infrastructure/github_headers_cache.dart';
import 'package:user_repo/github/core/infrastructure/github_repo_dto.dart';

abstract class ReposRemoteService {
  final Dio _dio;
  final GithubHeadersCache _headersCache;

  ReposRemoteService(this._dio, this._headersCache);

  Future<RemoteResponse<List<GithubRepoDTO>>> getPage({
    required Uri requestUri,
    required List<dynamic> Function(dynamic json) jsonDataSelector,
  }) async {
    final previousHeaders = await _headersCache.getHeaders(requestUri);

    try {
      final response = await _dio.getUri<dynamic>(
        requestUri,
        options: Options(
          headers: <String, String>{
            'If-None-Match': previousHeaders?.etag ?? '',
          },
        ),
      );

      if (response.statusCode == 304) {
        return RemoteResponse.notModified(
          maxPage: previousHeaders?.link?.maxPage ?? 0,
        );
      } else if (response.statusCode != 200) {
        throw RestApiException(response.statusCode);
      }

      final headers = GithubHeaders.parse(response);
      await _headersCache.saveHeaders(requestUri, headers);
      final convertedData = jsonDataSelector(response.data)
          .map((dynamic e) => GithubRepoDTO.fromJson(e as Map<String, dynamic>))
          .toList();
      return RemoteResponse.withNewData(
        convertedData,
        maxPage: headers.link?.maxPage ?? 1,
      );
    } on DioError catch (error) {
      if (error.isConnectionError) {
        return const RemoteResponse.noConnection();
      } else if (error.response != null) {
        throw RestApiException(error.response!.statusCode);
      }

      rethrow;
    }
  }
}
