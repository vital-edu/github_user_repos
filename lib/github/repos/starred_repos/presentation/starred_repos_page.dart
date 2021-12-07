import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:user_repo/github/repos/starred_repos/presentation/paginated_repos_list_view.dart';

class StarredReposPage extends ConsumerWidget {
  const StarredReposPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Starred repos'),
        actions: const [Icon(MdiIcons.logoutVariant)],
      ),
      body: const PaginatedReposListView(),
    );
  }
}
