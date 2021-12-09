import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_repo/github/core/domain/github_failure.dart';
import 'package:user_repo/github/shared/providers.dart';

class FailureRepoTile extends ConsumerWidget {
  final GithubFailure failure;

  const FailureRepoTile({
    Key? key,
    required this.failure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: Theme.of(context).errorColor,
      child: ListTileTheme(
        textColor: Theme.of(context).colorScheme.onError,
        iconColor: Theme.of(context).colorScheme.onError,
        child: ListTile(
          leading: const SizedBox(
            height: double.infinity,
            child: Icon(Icons.warning),
          ),
          title: const Text('An error occurred, please, retry'),
          subtitle: Text(
            failure.map(api: (_) => 'API returned ${_.errorCode}'),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref
                .read(starredReposNotifierProvider.notifier)
                .getNextStarredReposPage(),
          ),
        ),
      ),
    );
  }
}
