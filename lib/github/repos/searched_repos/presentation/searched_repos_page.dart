import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_repo/auth/shared/providers.dart';
import 'package:user_repo/core/presentation/router/app_router.gr.dart';
import 'package:user_repo/github/core/presentation/paginated_repos_list_view.dart';
import 'package:user_repo/github/shared/providers.dart';
import 'package:user_repo/search/presentation/search_bar.dart';

class SearchedReposPage extends StatefulHookConsumerWidget {
  final String searchedTerm;

  const SearchedReposPage({
    Key? key,
    required this.searchedTerm,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SearchedReposPageState();
}

class _SearchedReposPageState extends ConsumerState<SearchedReposPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => ref
          .read(searchedReposNotifierProvider.notifier)
          .getFirstSearchedReposPage(widget.searchedTerm),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SearchBar(
        body: PaginatedReposListView(
          paginatedReposNotifierProvider: searchedReposNotifierProvider,
          getNextPage: (ref) => ref
              .read(searchedReposNotifierProvider.notifier)
              .getNextSearchedReposPage(widget.searchedTerm),
          noResultsMessage:
              "This is all we could find for your search term. Really...",
        ),
        title: widget.searchedTerm,
        hint: 'Search all repositories...',
        onShouldNavigateToResultPage: (String searchedTerm) {
          AutoRouter.of(context).pushAndPopUntil(
            SearchedReposRoute(searchedTerm: searchedTerm),
            predicate: (route) => route.settings.name == StarredReposRoute.name,
          );
        },
        onSignOutButtonPressed: () {
          ref.read(authNotifierProvider.notifier).signOut();
        },
      ),
    );
  }
}
