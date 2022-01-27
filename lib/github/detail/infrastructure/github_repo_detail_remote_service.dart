import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
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
      } else if (error.response != null) {
        throw RestApiException(error.response?.statusCode);
      }

      rethrow;
    }
  }

  /// Returns `null` if there is no internet connection.
  Future<bool?> getStarredStatus(String fullRepoName) async {
    final requestUri = Uri(
      scheme: 'https',
      host: 'api.github.com',
      path: '/user/starred/$fullRepoName',
    );

    try {
      final response = await _dio.getUri<dynamic>(
        requestUri,
        options: Options(
          validateStatus: (status) =>
              status != null && (status >= 200 && status < 400) ||
              status == 404,
        ),
      );

      if (response.statusCode == 404) {
        return false;
      } else if (response.statusCode == 204) {
        return true;
      } else {
        RestApiException(response.statusCode);
      }
    } on DioError catch (error) {
      if (error.isConnectionError) {
        return null;
      } else if (error.response != null) {
        throw RestApiException(error.response?.statusCode);
      }

      rethrow;
    }
  }

  /// Returns `null` if there is no internet connection.
  Future<Unit?> switchStarredStatus(
    String fullRepoName, {
    required bool isCurrentStarred,
  }) async {
    final requestUri = Uri(
      scheme: 'https',
      host: 'api.github.com',
      path: '/user/starred/$fullRepoName',
    );

    try {
      final response = await (isCurrentStarred
          ? _dio.deleteUri<dynamic>(requestUri)
          : _dio.putUri<dynamic>(requestUri));

      if (response.statusCode != 204) {
        throw RestApiException(response.statusCode);
      }

      return unit;
    } on DioError catch (error) {
      if (error.isConnectionError) {
        return null;
      } else if (error.response != null) {
        throw RestApiException(error.response?.statusCode);
      }

      rethrow;
    }
  }
}
