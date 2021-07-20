import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_repo/auth/application/auth_notifier.dart';
import 'package:user_repo/auth/shared/providers.dart';
import 'package:user_repo/core/presentation/router/app_router.gr.dart';
import 'package:user_repo/core/shared/providers.dart';

final initializationProvider = FutureProvider<Unit>((ref) async {
  await ref.read(sembastDatabaseProvider).init();
  final notifier = ref.read(authNotifierProvider.notifier);
  await notifier.checkAndUpdateAuthStatus();
  return unit;
});

class AppWidget extends ConsumerWidget {
  final router = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(initializationProvider, (_) {});
    ref.listen<AuthState>(authNotifierProvider, (state) {
      state.maybeMap(
        orElse: () {},
        authenticated: (_) => router.pushAndPopUntil(
          const StarredReposRoute(),
          predicate: (_) => false,
        ),
        unauthenticated: (_) => router.pushAndPopUntil(
          const SignInRoute(),
          predicate: (_) => false,
        ),
      );
    });

    return MaterialApp.router(
      title: 'Repo Viewer',
      routeInformationParser: router.defaultRouteParser(),
      routerDelegate: router.delegate(),
    );
  }
}
