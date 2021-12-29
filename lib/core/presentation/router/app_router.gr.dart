// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../../../auth/presentation/authorization_page.dart' as _i5;
import '../../../auth/presentation/sign_in_page.dart' as _i4;
import '../../../github/repos/searched_repos/presentation/searched_repos_page.dart'
    as _i3;
import '../../../github/repos/starred_repos/presentation/starred_repos_page.dart'
    as _i2;
import '../../../splash/presentation/splash_page.dart' as _i1;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i6.MaterialPageX<_i1.SplashPage>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    StarredReposRoute.name: (routeData) {
      return _i6.MaterialPageX<_i2.StarredReposPage>(
          routeData: routeData, child: const _i2.StarredReposPage());
    },
    SearchedReposRoute.name: (routeData) {
      final args = routeData.argsAs<SearchedReposRouteArgs>();
      return _i6.MaterialPageX<_i3.SearchedReposPage>(
          routeData: routeData,
          child: _i3.SearchedReposPage(key: args.key, query: args.query));
    },
    SignInRoute.name: (routeData) {
      return _i6.MaterialPageX<_i4.SignInPage>(
          routeData: routeData, child: const _i4.SignInPage());
    },
    AuthorizationRoute.name: (routeData) {
      final args = routeData.argsAs<AuthorizationRouteArgs>();
      return _i6.MaterialPageX<_i5.AuthorizationPage>(
          routeData: routeData,
          child: _i5.AuthorizationPage(
              key: args.key,
              authorizationUrl: args.authorizationUrl,
              onAuthorizationCodeRedirectAttempt:
                  args.onAuthorizationCodeRedirectAttempt));
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(SplashRoute.name, path: '/'),
        _i6.RouteConfig(StarredReposRoute.name, path: '/starred'),
        _i6.RouteConfig(SearchedReposRoute.name, path: '/search'),
        _i6.RouteConfig(SignInRoute.name, path: '/signin'),
        _i6.RouteConfig(AuthorizationRoute.name, path: '/auth')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.StarredReposPage]
class StarredReposRoute extends _i6.PageRouteInfo<void> {
  const StarredReposRoute() : super(StarredReposRoute.name, path: '/starred');

  static const String name = 'StarredReposRoute';
}

/// generated route for
/// [_i3.SearchedReposPage]
class SearchedReposRoute extends _i6.PageRouteInfo<SearchedReposRouteArgs> {
  SearchedReposRoute({_i7.Key? key, required String query})
      : super(SearchedReposRoute.name,
            path: '/search',
            args: SearchedReposRouteArgs(key: key, query: query));

  static const String name = 'SearchedReposRoute';
}

class SearchedReposRouteArgs {
  const SearchedReposRouteArgs({this.key, required this.query});

  final _i7.Key? key;

  final String query;

  @override
  String toString() {
    return 'SearchedReposRouteArgs{key: $key, query: $query}';
  }
}

/// generated route for
/// [_i4.SignInPage]
class SignInRoute extends _i6.PageRouteInfo<void> {
  const SignInRoute() : super(SignInRoute.name, path: '/signin');

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i5.AuthorizationPage]
class AuthorizationRoute extends _i6.PageRouteInfo<AuthorizationRouteArgs> {
  AuthorizationRoute(
      {_i7.Key? key,
      required Uri authorizationUrl,
      required dynamic Function(Uri) onAuthorizationCodeRedirectAttempt})
      : super(AuthorizationRoute.name,
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

  final _i7.Key? key;

  final Uri authorizationUrl;

  final dynamic Function(Uri) onAuthorizationCodeRedirectAttempt;

  @override
  String toString() {
    return 'AuthorizationRouteArgs{key: $key, authorizationUrl: $authorizationUrl, onAuthorizationCodeRedirectAttempt: $onAuthorizationCodeRedirectAttempt}';
  }
}
