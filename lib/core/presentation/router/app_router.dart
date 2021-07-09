import 'package:auto_route/auto_route.dart';
import 'package:user_repo/auth/presentation/authorization_page.dart';
import 'package:user_repo/auth/presentation/sign_in_page.dart';
import 'package:user_repo/github/repos/starred_repos/presentation/starred_repos_page.dart';
import 'package:user_repo/splash/presentation/splash_page.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute<SplashPage>(page: SplashPage, initial: true),
    MaterialRoute<StarredReposPage>(page: StarredReposPage, path: '/starred'),
    MaterialRoute<SignInPage>(page: SignInPage, path: '/signin'),
    MaterialRoute<AuthorizationPage>(page: AuthorizationPage, path: '/auth'),
  ],
  replaceInRouteName: 'Page,Route',
)
class $AppRouter {}
