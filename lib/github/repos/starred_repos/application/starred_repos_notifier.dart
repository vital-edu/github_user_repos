import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_repo/core/domain/fresh.dart';
import 'package:user_repo/github/core/domain/github_failure.dart';
import 'package:user_repo/github/core/domain/github_repo.dart';

part 'starred_repos_notifier.freezed.dart';

@freezed
class StarredReposState with _$StarredReposState {
  const StarredReposState._();
  const factory StarredReposState.initial(
    Fresh<List<GithubRepo>> repos,
  ) = _Initial;
  const factory StarredReposState.loadInProgress(
    Fresh<List<GithubRepo>> repos,
    int itemsPerPage,
  ) = _LoadInProgress;
  const factory StarredReposState.loaded(
    Fresh<List<GithubRepo>> repos, {
    required bool isNextPageAvailable,
  }) = _Loaded;
  const factory StarredReposState.hasFailure(
    Fresh<List<GithubRepo>> repos,
    GithubFailure failure,
  ) = _HasFailure;
}
