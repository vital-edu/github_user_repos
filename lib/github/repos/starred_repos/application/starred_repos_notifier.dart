import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_repo/core/domain/fresh.dart';
import 'package:user_repo/github/core/domain/github_failure.dart';
import 'package:user_repo/github/core/domain/github_repo.dart';
import 'package:user_repo/github/core/infrastructure/pagination_config.dart';
import 'package:user_repo/github/repos/starred_repos/infrastructure/starred_repos_repository.dart';

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
  const factory StarredReposState.loadSuccess(
    Fresh<List<GithubRepo>> repos, {
    required bool isNextPageAvailable,
  }) = _LoadSuccess;
  const factory StarredReposState.hasFailure(
    Fresh<List<GithubRepo>> repos,
    GithubFailure failure,
  ) = _HasFailure;
}

class StarredReposNotifier extends StateNotifier<StarredReposState> {
  int _page = 0;
  final StarredReposRepository _repository;

  StarredReposNotifier(this._repository)
      : super(
          StarredReposState.initial(
            Fresh.yes([], isNextPageAvailable: true),
          ),
        );

  Future<void> getNextStarredReposPage() async {
    state = StarredReposState.loadInProgress(
      state.repos,
      PaginationConfig.itemsPerPage,
    );

    final failureOrRepos = await _repository.getStarredReposPage(_page);
    state = failureOrRepos.fold(
      (l) => StarredReposState.hasFailure(state.repos, l),
      (r) {
        _page++;
        return StarredReposState.loadSuccess(
          r.copyWith(
            entity: [...state.repos.entity, ...r.entity],
          ),
          isNextPageAvailable: r.isNextPageAvailable,
        );
      },
    );
  }
}
