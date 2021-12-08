import 'package:dio/dio.dart';
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
  ref.read(dioProvider)
    ..options = BaseOptions(
      headers: <String, dynamic>{
        'Accept': 'application/vnd.github.v3+json',
      },
      validateStatus: (status) =>
          status != null && status >= 200 && status < 400,
    )
    ..interceptors.add(ref.read(oAuth2InterceptorProvider));
  return unit;
});

class AppWidget extends ConsumerWidget {
  final router = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(initializationProvider, (_, __) {});
    ref.listen<AuthState>(authNotifierProvider, (_, state) {
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
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.defaultRouteParser(),
      routerDelegate: router.delegate(),
    );
  }
}
