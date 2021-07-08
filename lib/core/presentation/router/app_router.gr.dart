// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../../../auth/presentation/sign_in_page.dart' as _i5;
import '../../../splash/presentation/splash_page.dart' as _i3;
import '../../../starred_repos/presentation/starred_repos_page.dart' as _i4;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) => _i1.MaterialPageX<_i3.SplashPage>(
        routeData: routeData,
        builder: (_) {
          return const _i3.SplashPage();
        }),
    StarredReposRoute.name: (routeData) =>
        _i1.MaterialPageX<_i4.StarredReposPage>(
            routeData: routeData,
            builder: (_) {
              return const _i4.StarredReposPage();
            }),
    SignInRoute.name: (routeData) => _i1.MaterialPageX<_i5.SignInPage>(
        routeData: routeData,
        builder: (_) {
          return const _i5.SignInPage();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(SplashRoute.name, path: '/'),
        _i1.RouteConfig(StarredReposRoute.name, path: '/starred'),
        _i1.RouteConfig(SignInRoute.name, path: '/signin')
      ];
}

class SplashRoute extends _i1.PageRouteInfo {
  const SplashRoute() : super(name, path: '/');

  static const String name = 'SplashRoute';
}

class StarredReposRoute extends _i1.PageRouteInfo {
  const StarredReposRoute() : super(name, path: '/starred');

  static const String name = 'StarredReposRoute';
}

class SignInRoute extends _i1.PageRouteInfo {
  const SignInRoute() : super(name, path: '/signin');

  static const String name = 'SignInRoute';
}