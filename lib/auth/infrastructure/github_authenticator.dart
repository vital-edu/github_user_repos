import 'package:flutter/services.dart';
import 'package:oauth2/oauth2.dart';
import 'package:user_repo/auth/infrastructure/credentials_storage/credentials_storage.dart';

class GithubAuthenticator {
  final CredentialsStorage _storage;

  GithubAuthenticator({
    required CredentialsStorage storage,
  }) : _storage = storage;

  Future<Credentials?> getSignedInCredentials() async {
    try {
      final credentials = await _storage.read();
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
}
