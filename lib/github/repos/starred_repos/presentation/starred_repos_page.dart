import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:user_repo/auth/shared/providers.dart';
import 'package:user_repo/core/presentation/router/app_router.gr.dart';
import 'package:user_repo/github/core/presentation/paginated_repos_list_view.dart';
import 'package:user_repo/github/shared/providers.dart';

class StarredReposPage extends ConsumerWidget {
  const StarredReposPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Starred repos'),
        actions: [
          IconButton(
            icon: const Icon(MdiIcons.logoutVariant),
            onPressed: () => ref.read(authNotifierProvider.notifier).signOut(),
          ),
          IconButton(
            icon: const Icon(MdiIcons.magnify),
            onPressed: () => AutoRouter.of(context).push(
              SearchedReposRoute(query: 'Angular'),
            ),
          )
        ],
      ),
      body: PaginatedReposListView(
        paginatedReposNotifierProvider: starredReposNotifierProvider,
        getNextPage: (ref) => ref
            .read(starredReposNotifierProvider.notifier)
            .getNextStarredReposPage(),
        noResultsMessage:
            "That's about everything we could find in your starred repos right now.",
      ),
    );
  }
}
