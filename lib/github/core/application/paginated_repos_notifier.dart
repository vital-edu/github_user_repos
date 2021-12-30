import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_repo/core/domain/fresh.dart';
import 'package:user_repo/github/core/domain/github_failure.dart';
import 'package:user_repo/github/core/domain/github_repo.dart';
import 'package:user_repo/github/core/infrastructure/pagination_config.dart';

part 'paginated_repos_notifier.freezed.dart';

typedef RepositoryGetter
    = Future<Either<GithubFailure, Fresh<List<GithubRepo>>>> Function(int page);

@freezed
class PaginatedReposState with _$PaginatedReposState {
  const PaginatedReposState._();
  const factory PaginatedReposState.initial(
    Fresh<List<GithubRepo>> repos,
  ) = _Initial;
  const factory PaginatedReposState.loadInProgress(
    Fresh<List<GithubRepo>> repos,
    int itemsPerPage,
  ) = _LoadInProgress;
  const factory PaginatedReposState.loadSuccess(
    Fresh<List<GithubRepo>> repos, {
    required bool isNextPageAvailable,
  }) = _LoadSuccess;
  const factory PaginatedReposState.hasFailure(
    Fresh<List<GithubRepo>> repos,
    GithubFailure failure,
  ) = _HasFailure;
}

class PaginatedReposNotifier extends StateNotifier<PaginatedReposState> {
  int _page = 1;

  PaginatedReposNotifier()
      : super(
          PaginatedReposState.initial(
            Fresh.yes([], isNextPageAvailable: true),
          ),
        );

  @protected
  void resetState() {
    _page = 1;
    state = PaginatedReposState.initial(
      Fresh.yes([], isNextPageAvailable: true),
    );
  }

  @protected
  Future<void> getNextPage(RepositoryGetter repoGetter) async {
    state = PaginatedReposState.loadInProgress(
      state.repos,
      PaginationConfig.itemsPerPage,
    );

    final failureOrRepos = await repoGetter(_page);
    state = failureOrRepos.fold(
      (l) => PaginatedReposState.hasFailure(state.repos, l),
      (r) {
        _page++;
        return PaginatedReposState.loadSuccess(
          r.copyWith(
            entity: [...state.repos.entity, ...r.entity],
          ),
          isNextPageAvailable: r.isNextPageAvailable,
        );
      },
    );
  }
}
