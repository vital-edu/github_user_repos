import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_repo/auth/shared/providers.dart';
import 'package:user_repo/core/presentation/router/app_router.gr.dart';
import 'package:user_repo/github/core/presentation/paginated_repos_list_view.dart';
import 'package:user_repo/github/shared/providers.dart';
import 'package:user_repo/search/presentation/search_bar.dart';

class StarredReposPage extends ConsumerWidget {
  const StarredReposPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SearchBar(
        body: PaginatedReposListView(
          paginatedReposNotifierProvider: starredReposNotifierProvider,
          getNextPage: (ref) => ref
              .read(starredReposNotifierProvider.notifier)
              .getNextStarredReposPage(),
          noResultsMessage:
              "That's about everything we could find in your starred repos right now.",
        ),
        title: 'Starred repositories',
        hint: 'Search all repositories...',
        onShouldNavigateToResultPage: (String searchedTerm) {
          AutoRouter.of(context).push(SearchedReposRoute(query: searchedTerm));
        },
        onSignOutButtonPressed: () {
          ref.read(authNotifierProvider.notifier).signOut();
        },
      ),
    );
  }
}
