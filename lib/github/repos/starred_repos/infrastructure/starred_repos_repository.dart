import 'package:fpdart/fpdart.dart';
import 'package:user_repo/core/domain/fresh.dart';
import 'package:user_repo/core/infrastructure/network_exceptions.dart';
import 'package:user_repo/github/core/domain/github_failure.dart';
import 'package:user_repo/github/core/domain/github_repo.dart';
import 'package:user_repo/github/core/infrastructure/github_repo_dto.dart';
import 'package:user_repo/github/repos/starred_repos/infrastructure/starred_repos_remote_service.dart';

class StarredReposRepository {
  final StarredReposRemoteService _remoteService;
  // TODO: add _localService.

  StarredReposRepository(this._remoteService);

  Future<Either<GithubFailure, Fresh<List<GithubRepo>>>> getStarredReposPage(
    int page,
  ) async {
    try {
      final response = await _remoteService.getStarredReposPage(page);
      return response.when(
        // TODO: fetch data from localService
        noConnection: (maxPage) => right(
          Fresh.no([], isNextPageAvailable: page < maxPage),
        ),
        // TODO: fetch data from localService
        notModified: (maxPage) => right(
          Fresh.yes([], isNextPageAvailable: page < maxPage),
        ),
        withNewData: (data, maxPage) => right(
          Fresh.yes(data.toDomain(), isNextPageAvailable: page < maxPage),
        ),
      );
    } on RestApiException catch (error) {
      return left(GithubFailure.api(error.errorCode));
    }
  }
}

extension DTOListToDomainList on List<GithubRepoDTO> {
  List<GithubRepo> toDomain() => map((e) => e.toDomain()).toList();
}
