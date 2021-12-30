import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_repo/core/domain/fresh.dart';
import 'package:user_repo/github/core/domain/github_failure.dart';
import 'package:user_repo/github/detail/domain/github_repo_detail.dart';
import 'package:user_repo/github/detail/infrastructure/github_repo_detail_repository.dart';

part 'github_repo_detail_notifier.freezed.dart';

@freezed
class GithubRepoDetailState with _$GithubRepoDetailState {
  const GithubRepoDetailState._();
  const factory GithubRepoDetailState.initial({
    @Default(false) bool hasStarredStatusChanged,
  }) = _Initial;
  const factory GithubRepoDetailState.loadInProgress({
    @Default(false) bool hasStarredStatusChanged,
  }) = _LoadInProgress;
  const factory GithubRepoDetailState.loadFailure(
    GithubFailure failure, {
    @Default(false) bool hasStarredStatusChanged,
  }) = _LoadFailure;
  const factory GithubRepoDetailState.loadSuccess(
    Fresh<GithubRepoDetail?> repoDetail, {
    @Default(false) bool hasStarredStatusChanged,
  }) = _LoadSuccess;
}

class GithubRepoDetailNotifier extends StateNotifier<GithubRepoDetailState> {
  final GithubRepoDetailRepository _repository;

  GithubRepoDetailNotifier(
    this._repository,
  ) : super(const GithubRepoDetailState.initial());

  Future<void> getRepoDetail(String fullRepoName) async {
    state = const GithubRepoDetailState.loadInProgress();
    final result = await _repository.getRepoDetail(fullRepoName);

    state = result.fold(
      (l) => GithubRepoDetailState.loadFailure(l),
      (r) => GithubRepoDetailState.loadSuccess(r),
    );
  }

  Future<void> swithStarredStatus(GithubRepoDetail repo) async {
    state.maybeMap(
      orElse: () {},
      loadSuccess: (successState) async {
        final stateCopy = successState.copyWith();
        final repoDetail = successState.repoDetail.entity;

        if (repoDetail != null) {
          state = successState.copyWith.repoDetail(
            entity: repoDetail.copyWith(starred: !repoDetail.starred),
          );

          final result = await _repository.switchStarredStatus(repoDetail);
          state = result.fold(
            (l) => stateCopy,
            (r) => r == null
                ? stateCopy
                : successState.copyWith(
                    hasStarredStatusChanged: true,
                  ),
          );
        }
      },
    );
  }
}
