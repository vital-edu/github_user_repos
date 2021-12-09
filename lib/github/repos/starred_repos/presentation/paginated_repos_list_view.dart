import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_repo/github/repos/starred_repos/application/starred_repos_notifier.dart';
import 'package:user_repo/github/repos/starred_repos/presentation/failure_repo_tile.dart';
import 'package:user_repo/github/repos/starred_repos/presentation/loading_repo_tile.dart';
import 'package:user_repo/github/repos/starred_repos/presentation/repo_tile.dart';
import 'package:user_repo/github/shared/providers.dart';

class PaginatedReposListView extends ConsumerStatefulWidget {
  const PaginatedReposListView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PaginatedReposListViewState();
}

class _PaginatedReposListViewState
    extends ConsumerState<PaginatedReposListView> {
  bool canLoadNextPage = true;

  @override
  void initState() {
    super.initState();
    ref.read(starredReposNotifierProvider.notifier).getNextStarredReposPage();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(starredReposNotifierProvider);

    ref.listen<StarredReposState>(starredReposNotifierProvider,
        (previous, next) {
      next.map(
        initial: (_) => canLoadNextPage = true,
        loadInProgress: (_) => canLoadNextPage = false,
        loadSuccess: (_) => canLoadNextPage = _.isNextPageAvailable,
        hasFailure: (_) => canLoadNextPage = false,
      );
    });

    return NotificationListener<ScrollNotification>(
      child: _PaginatedReposListView(state: state),
      onNotification: (notification) {
        final pixels = notification.metrics.pixels;
        final viewportDimension = notification.metrics.viewportDimension;
        final maxScrollExtent = notification.metrics.maxScrollExtent;

        final limit = maxScrollExtent - viewportDimension / 3;

        if (canLoadNextPage && pixels >= limit) {
          canLoadNextPage = false;
          ref
              .read(starredReposNotifierProvider.notifier)
              .getNextStarredReposPage();
        }
        return false;
      },
    );
  }
}

class _PaginatedReposListView extends StatelessWidget {
  const _PaginatedReposListView({
    Key? key,
    required this.state,
  }) : super(key: key);

  final StarredReposState state;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return state.map(
          initial: (_) => Container(),
          loadInProgress: (_) => (index < _.repos.entity.length)
              ? RepoTile(repo: _.repos.entity[index])
              : const LoadingRepoTile(),
          loadSuccess: (_) => RepoTile(repo: _.repos.entity[index]),
          hasFailure: (_) => index < _.repos.entity.length
              ? RepoTile(repo: _.repos.entity[index])
              : FailureRepoTile(failure: _.failure),
        );
      },
      itemCount: state.map(
        initial: (_) => 0,
        loadInProgress: (_) => _.repos.entity.length + _.itemsPerPage,
        loadSuccess: (_) => _.repos.entity.length,
        hasFailure: (_) => _.repos.entity.length + 1,
      ),
    );
  }
}
