import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_repo/auth/domain/auth_failure.dart';
import 'package:user_repo/auth/infrastructure/github_authenticator.dart';

part 'auth_notifier.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.unauthenticated() = _Unauthenticated;
  const factory AuthState.authenticated() = _Authenticated;
  const factory AuthState.failure(AuthFailure failure) = _Failure;
}

typedef AuthUriCallback = Future<Uri> Function({Uri authorizationUrl});

class AuthNotifier extends StateNotifier<AuthState> {
  final GithubAuthenticator _authenticator;

  AuthNotifier(this._authenticator) : super(const AuthState.initial());

  Future<void> checkAndUpdateAuthStatus() async {
    state = (await _authenticator.isSignedIn)
        ? const AuthState.authenticated()
        : const AuthState.unauthenticated();
  }

  Future<void> signIn(AuthUriCallback authorizationCallback) async {
    final grant = _authenticator.createGrant();
    final authorizationUrl = _authenticator.getAuthorizationUrl(grant);
    final authorizationResponse = await authorizationCallback(
      authorizationUrl: authorizationUrl,
    );

    final result = await _authenticator.handleAuthorizationResponse(
      grant,
      authorizationResponse.queryParameters,
    );
    state = result.fold(
      (failure) => AuthState.failure(failure),
      (success) => const AuthState.authenticated(),
    );

    grant.close();
  }

  Future<void> signOut() async {
    final resut = await _authenticator.signOut();
    state = resut.fold(
      (failure) => AuthState.failure(failure),
      (sucess) => const AuthState.unauthenticated(),
    );
  }
}
