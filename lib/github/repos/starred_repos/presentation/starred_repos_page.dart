import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_repo/auth/shared/providers.dart';
import 'package:user_repo/core/presentation/router/app_router.gr.dart';
import 'package:user_repo/github/core/presentation/paginated_repos_list_view.dart';
import 'package:user_repo/github/shared/providers.dart';
import 'package:user_repo/search/presentation/search_bar.dart';

class StarredReposPage extends StatefulHookConsumerWidget {
  const StarredReposPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _StarredReposPageState();
}

class _StarredReposPageState extends ConsumerState<StarredReposPage> {
  @override
  void initState() {
    super.initState();
    ref.read(starredReposNotifierProvider.notifier).getNextStarredReposPage();
  }

  @override
  Widget build(BuildContext context) {
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
          AutoRouter.of(context)
              .push(SearchedReposRoute(searchedTerm: searchedTerm));
        },
        onSignOutButtonPressed: () {
          ref.read(authNotifierProvider.notifier).signOut();
        },
      ),
    );
  }
}
