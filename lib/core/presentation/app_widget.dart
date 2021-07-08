import 'package:flutter/material.dart';
import 'package:user_repo/core/presentation/router/app_router.gr.dart';

class AppWidget extends StatelessWidget {
  final router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Repo Viewer',
      routeInformationParser: router.defaultRouteParser(),
      routerDelegate: router.delegate(),
    );
  }
}
