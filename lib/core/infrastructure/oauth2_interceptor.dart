import 'package:dio/dio.dart';
import 'package:user_repo/auth/application/auth_notifier.dart';
import 'package:user_repo/auth/infrastructure/github_authenticator.dart';

class OAuth2Interceptor extends Interceptor {
  final GithubAuthenticator _authenticator;
  final AuthNotifier _notifier;
  final Dio _dio;

  OAuth2Interceptor(this._authenticator, this._notifier, this._dio);

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final credentials = await _authenticator.getSignedInCredentials();
    if (credentials == null) return handler.next(options);

    final modifiedOptions = options
      ..headers.addAll(
        <String, dynamic>{
          'authorization': 'Bearer ${credentials.accessToken}',
        },
      );

    handler.next(modifiedOptions);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    final errorResponse = err.response;

    if (errorResponse != null && errorResponse.statusCode == 401) {
      final credentials = await _authenticator.getSignedInCredentials();
      if (credentials != null && credentials.canRefresh) {
        await _authenticator.refresh(credentials: credentials);
      } else {
        await _authenticator.clearCredentials();
      }

      await _notifier.checkAndUpdateAuthStatus();
      final refreshedCredentials =
          await _authenticator.getSignedInCredentials();

      if (refreshedCredentials != null) {
        final authorizationHeader =
            'Bearer ${refreshedCredentials.accessToken}';
        handler.resolve(
          await _dio.fetch<dynamic>(
            errorResponse.requestOptions
              ..headers['Authorization'] = authorizationHeader,
          ),
        );
      }
    } else {
      return handler.next(err);
    }
  }
}
