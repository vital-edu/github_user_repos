import 'package:fpdart/fpdart.dart';
import 'package:user_repo/core/domain/fresh.dart';
import 'package:user_repo/core/infrastructure/network_exceptions.dart';
import 'package:user_repo/github/core/domain/github_failure.dart';
import 'package:user_repo/github/core/domain/github_repo.dart';
import 'package:user_repo/github/repos/core/infrastructure/extensions.dart';
import 'package:user_repo/github/repos/search_repos/infrastructure/searched_repos_remote_service.dart';

class SearchedReposRepository {
  final SearchedReposRemoteService _remoteService;

  SearchedReposRepository(this._remoteService);

  Future<Either<GithubFailure, Fresh<List<GithubRepo>>>> getSearchedReposPage({
    required String query,
    required int page,
  }) async {
    try {
      final result =
          await _remoteService.getSearchedReposPage(query: query, page: page);
      return right(
        result.maybeMap(
          withNewData: (_) => Fresh.yes(
            _.data.toDomain(),
            isNextPageAvailable: page < _.maxPage,
          ),
          orElse: () => Fresh.no(
            <GithubRepo>[],
            isNextPageAvailable: false,
          ),
        ),
      );
    } on RestApiException catch (error) {
      return left(GithubFailure.api(error.errorCode));
    }
  }
}
