import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:user_repo/auth/shared/providers.dart';
import 'package:user_repo/core/presentation/router/app_router.gr.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(MdiIcons.github, size: 150),
                  const SizedBox(height: 16),
                  Text(
                    'Welcome to Repo Viewer',
                    style: Theme.of(context).textTheme.headline3,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                    onPressed: () => ref
                        .read(authNotifierProvider.notifier)
                        .signIn(({required Uri authorizationUrl}) {
                      final Completer<Uri> completer = Completer();
                      AutoRouter.of(context).push(
                        AuthorizationRoute(
                          authorizationUrl: authorizationUrl,
                          onAuthorizationCodeRedirectAttempt: (
                            Uri redirectUrl,
                          ) =>
                              completer.complete(redirectUrl),
                        ),
                      );

                      return completer.future;
                    }),
                    child: const Text('Sign In'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
