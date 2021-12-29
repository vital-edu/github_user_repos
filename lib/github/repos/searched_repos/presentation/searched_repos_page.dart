import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:user_repo/github/core/presentation/paginated_repos_list_view.dart';
import 'package:user_repo/github/shared/providers.dart';

class SearchedReposPage extends ConsumerWidget {
  final String query;

  const SearchedReposPage({
    Key? key,
    required this.query,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Searched repos'),
        actions: const [Icon(MdiIcons.logoutVariant)],
      ),
      body: PaginatedReposListView(
        paginatedReposNotifierProvider: searchedReposNotifierProvider,
        getNextPage: (ref) => ref
            .read(searchedReposNotifierProvider.notifier)
            .getNextSearchedReposPage(query),
        noResultsMessage:
            "This is all we could find for your search term. Really...",
      ),
    );
  }
}
