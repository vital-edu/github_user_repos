// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../../../auth/presentation/authorization_page.dart' as _i4;
import '../../../auth/presentation/sign_in_page.dart' as _i3;
import '../../../github/repos/starred_repos/presentation/starred_repos_page.dart'
    as _i2;
import '../../../splash/presentation/splash_page.dart' as _i1;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i5.MaterialPageX<_i1.SplashPage>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    StarredReposRoute.name: (routeData) {
      return _i5.MaterialPageX<_i2.StarredReposPage>(
          routeData: routeData, child: const _i2.StarredReposPage());
    },
    SignInRoute.name: (routeData) {
      return _i5.MaterialPageX<_i3.SignInPage>(
          routeData: routeData, child: const _i3.SignInPage());
    },
    AuthorizationRoute.name: (routeData) {
      final args = routeData.argsAs<AuthorizationRouteArgs>();
      return _i5.MaterialPageX<_i4.AuthorizationPage>(
          routeData: routeData,
          child: _i4.AuthorizationPage(
              key: args.key,
              authorizationUrl: args.authorizationUrl,
              onAuthorizationCodeRedirectAttempt:
                  args.onAuthorizationCodeRedirectAttempt));
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(SplashRoute.name, path: '/'),
        _i5.RouteConfig(StarredReposRoute.name, path: '/starred'),
        _i5.RouteConfig(SignInRoute.name, path: '/signin'),
        _i5.RouteConfig(AuthorizationRoute.name, path: '/auth')
      ];
}

/// generated route for [_i1.SplashPage]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute() : super(name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for [_i2.StarredReposPage]
class StarredReposRoute extends _i5.PageRouteInfo<void> {
  const StarredReposRoute() : super(name, path: '/starred');

  static const String name = 'StarredReposRoute';
}

/// generated route for [_i3.SignInPage]
class SignInRoute extends _i5.PageRouteInfo<void> {
  const SignInRoute() : super(name, path: '/signin');

  static const String name = 'SignInRoute';
}

/// generated route for [_i4.AuthorizationPage]
class AuthorizationRoute extends _i5.PageRouteInfo<AuthorizationRouteArgs> {
  AuthorizationRoute(
      {_i6.Key? key,
      required Uri authorizationUrl,
      required dynamic Function(Uri) onAuthorizationCodeRedirectAttempt})
      : super(name,
            path: '/auth',
            args: AuthorizationRouteArgs(
                key: key,
                authorizationUrl: authorizationUrl,
                onAuthorizationCodeRedirectAttempt:
                    onAuthorizationCodeRedirectAttempt));

  static const String name = 'AuthorizationRoute';
}

class AuthorizationRouteArgs {
  const AuthorizationRouteArgs(
      {this.key,
      required this.authorizationUrl,
      required this.onAuthorizationCodeRedirectAttempt});

  final _i6.Key? key;

  final Uri authorizationUrl;

  final dynamic Function(Uri) onAuthorizationCodeRedirectAttempt;
}
