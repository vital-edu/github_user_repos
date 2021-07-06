import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_repo/auth/application/auth_notifier.dart';
import 'package:user_repo/auth/infrastructure/credentials_storage/credentials_storage.dart';
import 'package:user_repo/auth/infrastructure/credentials_storage/secure_credentials_storage.dart';
import 'package:user_repo/auth/infrastructure/github_authenticator.dart';

final dioProvider = Provider((ref) => Dio());

final flutterSecureStorageProvider = Provider(
  (ref) => const FlutterSecureStorage(),
);

final credentialsStorageProvider = Provider<CredentialsStorage>(
  (ref) => SecureCredentialsStorage(
    ref.watch(flutterSecureStorageProvider),
  ),
);

final githubAuthenticatorProvider = Provider(
  (ref) => GithubAuthenticator(
    ref.watch(credentialsStorageProvider),
    ref.watch(dioProvider),
  ),
);

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(ref.watch(githubAuthenticatorProvider)),
);
