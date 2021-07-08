import 'package:flutter/material.dart';

class AuthorizationPage extends StatelessWidget {
  final Uri authorizationUrl;
  final Function(Uri redirectedUrl) onAuthorizationCodeRedirectAttempt;

  const AuthorizationPage({
    Key? key,
    required this.authorizationUrl,
    required this.onAuthorizationCodeRedirectAttempt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
