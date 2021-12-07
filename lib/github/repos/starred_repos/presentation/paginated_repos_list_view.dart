import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
  @override
  void initState() {
    super.initState();
    ref.read(starredReposNotifierProvider.notifier).getNextStarredReposPage();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(starredReposNotifierProvider);

    return ListView.builder(
      itemBuilder: (context, index) {
        return state.maybeMap(
          loadSuccess: (_) => Text(_.repos.entity[index].name),
          orElse: () => Text('Unknown'),
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
