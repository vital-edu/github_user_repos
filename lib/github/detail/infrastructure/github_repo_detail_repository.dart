import 'package:fpdart/fpdart.dart';
import 'package:user_repo/core/domain/fresh.dart';
import 'package:user_repo/core/infrastructure/network_exceptions.dart';
import 'package:user_repo/github/core/domain/github_failure.dart';
import 'package:user_repo/github/detail/domain/github_repo_detail.dart';
import 'package:user_repo/github/detail/infrastructure/github_repo_detail_dto.dart';
import 'package:user_repo/github/detail/infrastructure/github_repo_detail_local_service.dart';
import 'package:user_repo/github/detail/infrastructure/github_repo_detail_remote_service.dart';

class GithubRepoDetailRepository {
  final GithubRepoDetailLocalService _localService;
  final GithubRepoDetailRemoteService _remoteService;

  GithubRepoDetailRepository(this._localService, this._remoteService);

  /// Returns `right(null)`  if there is no internet connection.
  Future<Either<GithubFailure, Unit?>> switchStarredStatus(
    GithubRepoDetail repo,
  ) async {
    try {
      final result = await _remoteService.switchStarredStatus(
        repo.fullName,
        isCurrentStarred: repo.starred,
      );

      return right(result);
    } on RestApiException catch (error) {
      return left(GithubFailure.api(error.errorCode));
    }
  }

  Future<Either<GithubFailure, Fresh<GithubRepoDetail?>>> getRepoDetail(
    String fullRepoName,
  ) async {
    try {
      final htmlRemoteResult = await _remoteService.getReadmeHtml(fullRepoName);
      return right(
        await htmlRemoteResult.when(
          noConnection: () async {
            return Fresh.no(
              (await _localService.getRepoDetail(fullRepoName))?.toDomain(),
            );
          },
          notModified: (_) async {
            final cached = await _localService.getRepoDetail(fullRepoName);
            final updatedStarred = await _remoteService.getStarredStatus(
              fullRepoName,
            );
            final dto = cached?.copyWith(
              starred: updatedStarred ?? (cached.starred),
            );

            if (dto != null && updatedStarred != null) {
              _localService.upsertRepoDetail(dto);
            }

            return Fresh.yes(dto?.toDomain());
          },
          withNewData: (html, _) async {
            final starred =
                (await _remoteService.getStarredStatus(fullRepoName)) ??
                    (await _localService.getRepoDetail(fullRepoName))?.starred;

            final dto = GithubRepoDetailDTO(
              fullName: fullRepoName,
              html: html,
              starred: starred ?? false,
            );
            _localService.upsertRepoDetail(dto);

            return Fresh.yes(dto.toDomain());
          },
        ),
      );
    } on RestApiException catch (error) {
      return left(GithubFailure.api(error.errorCode));
    }
  }
}
