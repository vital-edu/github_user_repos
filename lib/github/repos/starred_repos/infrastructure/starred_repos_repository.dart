import 'package:fpdart/fpdart.dart';
import 'package:user_repo/core/domain/fresh.dart';
import 'package:user_repo/core/infrastructure/network_exceptions.dart';
import 'package:user_repo/github/core/domain/github_failure.dart';
import 'package:user_repo/github/core/domain/github_repo.dart';
import 'package:user_repo/github/core/infrastructure/github_repo_dto.dart';
import 'package:user_repo/github/repos/starred_repos/infrastructure/starred_repos_local_service.dart';
import 'package:user_repo/github/repos/starred_repos/infrastructure/starred_repos_remote_service.dart';

class StarredReposRepository {
  final StarredReposRemoteService _remoteService;
  final StarredReposLocalService _localService;

  StarredReposRepository(this._remoteService, this._localService);

  Future<Either<GithubFailure, Fresh<List<GithubRepo>>>> getStarredReposPage(
    int page,
  ) async {
    try {
      final response = await _remoteService.getStarredReposPage(page);
      return right(
        await response.when(
          noConnection: (maxPage) async {
            final localData = await _localService.getPage(page);
            return Fresh.no(
              localData.toDomain(),
              isNextPageAvailable: page < maxPage,
            );
          },
          notModified: (maxPage) async {
            final localData = await _localService.getPage(page);
            return Fresh.yes(
              localData.toDomain(),
              isNextPageAvailable: page < maxPage,
            );
          },
          withNewData: (data, maxPage) async {
            await _localService.upsertPage(data, page);
            return Fresh.yes(
              data.toDomain(),
              isNextPageAvailable: page < maxPage,
            );
          },
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
