import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:user_repo/core/presentation/router/app_router.gr.dart';
import 'package:user_repo/github/core/domain/github_repo.dart';

class RepoTile extends StatelessWidget {
  final GithubRepo repo;

  const RepoTile({
    required this.repo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Hero(
        tag: repo.fullName,
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage:
              CachedNetworkImageProvider(repo.owner.avatarUrlSmall),
        ),
      ),
      title: Text(repo.name),
      subtitle: Text(
        repo.description,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.star_border),
          Text(
            '${repo.stargazersCount}',
            style: Theme.of(context).textTheme.caption,
          )
        ],
      ),
      onTap: () {
        AutoRouter.of(context).push(GithubRepoDetailRoute(repo: repo));
      },
    );
  }
}
