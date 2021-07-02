import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:fpdart/fpdart.dart';
import 'package:oauth2/oauth2.dart';
import 'package:user_repo/auth/domain/auth_failure.dart';
import 'package:user_repo/auth/infrastructure/credentials_storage/credentials_storage.dart';
import 'package:http/http.dart' as http;
import 'package:user_repo/core/shared/encoders.dart';

class GithubOAuthHttpClient extends http.BaseClient {
  final httpClient = http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    request.headers['accept'] = 'application/json';
    return httpClient.send(request);
  }
}

class GithubAuthenticator {
  final CredentialsStorage _credentialsStorage;
  final Dio _dioClient;

  static final authorizationEndpoint =
      Uri.parse('https://github.com/login/oauth/authorize');
  static final tokenEndpoint =
      Uri.parse('https://github.com/login/oauth/access_token');
  static final revocationTokenEndpoint =
      Uri.parse('https://api.github.com/applications/$clientId/token');
  static final redirectUrl = Uri.parse('http://localhost:3000/callback');
  static const clientId = '4ef5c6c9802322402342';
  static const clientSecret = '91803395c711651d3529e260b16b4a7865c1dc37';
  static const scopes = ['read:user', 'repo'];

  GithubAuthenticator(
    CredentialsStorage credentialsStorage,
    Dio dioClient,
  )   : _credentialsStorage = credentialsStorage,
        _dioClient = dioClient;

  Future<Credentials?> getSignedInCredentials() async {
    try {
      final credentials = await _credentialsStorage.read();
      if (credentials != null) {
        if (credentials.canRefresh && credentials.isExpired) {
          // TODO: get new token
        }
      }

      return credentials;
    } on PlatformException {
      return null;
    }
  }

  Future<bool> get isSignedIn =>
      getSignedInCredentials().then((credentials) => credentials != null);

  AuthorizationCodeGrant createGrant() {
    return AuthorizationCodeGrant(
      clientId,
      authorizationEndpoint,
      tokenEndpoint,
      secret: clientSecret,
      httpClient: GithubOAuthHttpClient(),
    );
  }

  Uri getAuthorizationUrl(AuthorizationCodeGrant grant) {
    return grant.getAuthorizationUrl(redirectUrl, scopes: scopes);
  }

  Future<Either<AuthFailure, Unit>> handleAuthorizationResponse(
    AuthorizationCodeGrant grant,
    Map<String, String> params,
  ) async {
    try {
      final httpClient = await grant.handleAuthorizationResponse(params);
      await _credentialsStorage.save(httpClient.credentials);
      return right(unit);
    } on FormatException {
      return left(const AuthFailure.server());
    } on AuthorizationException catch (error) {
      return left(AuthFailure.server('${error.error}: ${error.description}'));
    } on PlatformException {
      return left(const AuthFailure.storage());
    }
  }

  Future<Either<AuthFailure, Unit>> signOut() async {
    final accessToken = await _credentialsStorage
        .read()
        .then((credentials) => credentials?.accessToken);
    final userAndPassword =
        stringToBase64Encoder.encode('$clientId:$clientSecret');

    try {
      _dioClient.deleteUri<String>(
        revocationTokenEndpoint,
        data: {
          'access_token': accessToken,
        },
        options: Options(
          headers: <String, String>{
            'Authorization': 'bearer $userAndPassword',
            'Accept': 'application/vnd.github.v3+json',
          },
        ),
      );
      await _credentialsStorage.clear();
      return right(unit);
    } on PlatformException {
      return left<AuthFailure, Unit>(const AuthFailure.server());
    }
  }
}
