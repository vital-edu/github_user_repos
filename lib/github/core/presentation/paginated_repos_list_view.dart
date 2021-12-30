import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:user_repo/core/presentation/toast.dart';
import 'package:user_repo/github/core/application/paginated_repos_notifier.dart';
import 'package:user_repo/github/core/presentation/failure_repo_tile.dart';
import 'package:user_repo/github/core/presentation/loading_repo_tile.dart';
import 'package:user_repo/github/core/presentation/no_results_display.dart';
import 'package:user_repo/github/core/presentation/repo_tile.dart';

class PaginatedReposListView extends ConsumerStatefulWidget {
  final AutoDisposeStateNotifierProvider<PaginatedReposNotifier,
      PaginatedReposState> paginatedReposNotifierProvider;
  final Function(WidgetRef ref) getNextPage;
  final String noResultsMessage;

  const PaginatedReposListView({
    Key? key,
    required this.paginatedReposNotifierProvider,
    required this.getNextPage,
    required this.noResultsMessage,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PaginatedReposListViewState();
}

class _PaginatedReposListViewState
    extends ConsumerState<PaginatedReposListView> {
  bool canLoadNextPage = true;
  bool hasAlreadyShownNoConnectionToast = false;

  @override
  Widget build(BuildContext context) {
    final state =
        ref.watch<PaginatedReposState>(widget.paginatedReposNotifierProvider);

    ref.listen<PaginatedReposState>(widget.paginatedReposNotifierProvider,
        (previous, next) {
      next.map(
        initial: (_) => canLoadNextPage = true,
        loadInProgress: (_) => canLoadNextPage = false,
        loadSuccess: (_) {
          if (!_.repos.isFresh && !hasAlreadyShownNoConnectionToast) {
            hasAlreadyShownNoConnectionToast = true;
            showNoConnectionToast(
              context: context,
              message: "You're not online. Some information may be outdated.",
            );
          }
          canLoadNextPage = _.isNextPageAvailable;
        },
        hasFailure: (_) => canLoadNextPage = false,
      );
    });

    return NotificationListener<ScrollNotification>(
      child: state.maybeMap(
        loadSuccess: (_) => _.repos.entity.isEmpty,
        orElse: () => false,
      )
          ? NoResultsDisplay(message: widget.noResultsMessage)
          : _PaginatedReposListView(state: state),
      onNotification: (notification) {
        final pixels = notification.metrics.pixels;
        final viewportDimension = notification.metrics.viewportDimension;
        final maxScrollExtent = notification.metrics.maxScrollExtent;

        final limit = maxScrollExtent - viewportDimension / 3;

        if (canLoadNextPage && pixels >= limit) {
          canLoadNextPage = false;
          widget.getNextPage(ref);
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

  final PaginatedReposState state;

  @override
  Widget build(BuildContext context) {
    final searchBarHeight = FloatingSearchBar.of(context)?.widget.height;
    final baseMargin = MediaQuery.of(context).padding.top + 8;
    final topMargin =
        searchBarHeight != null ? searchBarHeight + baseMargin : 0.0;

    return ListView.builder(
      padding: EdgeInsets.only(top: topMargin),
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
