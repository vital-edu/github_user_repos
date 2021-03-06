import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_repo/core/shared/providers.dart';
import 'package:user_repo/github/core/application/paginated_repos_notifier.dart';
import 'package:user_repo/github/core/infrastructure/github_headers_cache.dart';
import 'package:user_repo/github/detail/application/github_repo_detail_notifier.dart';
import 'package:user_repo/github/detail/infrastructure/github_repo_detail_local_service.dart';
import 'package:user_repo/github/detail/infrastructure/github_repo_detail_remote_service.dart';
import 'package:user_repo/github/detail/infrastructure/github_repo_detail_repository.dart';
import 'package:user_repo/github/repos/searched_repos/application/searched_repos_notifier.dart';
import 'package:user_repo/github/repos/searched_repos/infrastructure/searched_repos_remote_service.dart';
import 'package:user_repo/github/repos/searched_repos/infrastructure/searched_repos_repository.dart';
import 'package:user_repo/github/repos/starred_repos/application/starred_repos_notifier.dart';
import 'package:user_repo/github/repos/starred_repos/infrastructure/starred_repos_local_service.dart';
import 'package:user_repo/github/repos/starred_repos/infrastructure/starred_repos_remote_service.dart';
import 'package:user_repo/github/repos/starred_repos/infrastructure/starred_repos_repository.dart';

final githubHeadersCacheProvider = Provider(
  (ref) => GithubHeadersCache(ref.watch(sembastDatabaseProvider)),
);

final starredReposLocalServiceProvider = Provider(
  (ref) => StarredReposLocalService(ref.watch(sembastDatabaseProvider)),
);

final starredReposRemoteServiceProvider = Provider(
  (ref) => StarredReposRemoteService(
    ref.watch(dioProvider),
    ref.watch(githubHeadersCacheProvider),
  ),
);

final starredReposRepositoryProvider = Provider(
  (ref) => StarredReposRepository(
    ref.watch(starredReposRemoteServiceProvider),
    ref.watch(starredReposLocalServiceProvider),
  ),
);

final starredReposNotifierProvider = StateNotifierProvider.autoDispose<
    StarredReposNotifier, PaginatedReposState>(
  (ref) => StarredReposNotifier(ref.watch(starredReposRepositoryProvider)),
);

final searchedReposRemoteServiceProvider = Provider(
  (ref) => SearchedReposRemoteService(
    ref.watch(dioProvider),
    ref.watch(githubHeadersCacheProvider),
  ),
);

final searchedReposRepositoryProvider = Provider(
  (ref) => SearchedReposRepository(
    ref.watch(searchedReposRemoteServiceProvider),
  ),
);

final searchedReposNotifierProvider = StateNotifierProvider.autoDispose<
    SearchedReposNotifier, PaginatedReposState>(
  (ref) => SearchedReposNotifier(ref.watch(searchedReposRepositoryProvider)),
);

final repoDetailRemoteServiceProvider = Provider(
  (ref) => GithubRepoDetailRemoteService(
    ref.watch(dioProvider),
    ref.watch(githubHeadersCacheProvider),
  ),
);

final repoDetailLocalServiceProvider = Provider(
  (ref) => GithubRepoDetailLocalService(
    ref.watch(sembastDatabaseProvider),
    ref.watch(githubHeadersCacheProvider),
  ),
);

final repoDetailRepositoryProvider = Provider(
  (ref) => GithubRepoDetailRepository(
    ref.watch(repoDetailLocalServiceProvider),
    ref.watch(repoDetailRemoteServiceProvider),
  ),
);

final repoDetailNotifierProvider = StateNotifierProvider.autoDispose<
    GithubRepoDetailNotifier, GithubRepoDetailState>(
  (ref) => GithubRepoDetailNotifier(
    ref.watch(repoDetailRepositoryProvider),
  ),
);
