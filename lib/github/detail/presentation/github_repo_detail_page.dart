import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:user_repo/github/core/domain/github_repo.dart';

class GithubRepoDetailPage extends StatefulWidget {
  final GithubRepo repo;

  const GithubRepoDetailPage({Key? key, required this.repo}) : super(key: key);

  @override
  _GithubRepoDetailPageState createState() => _GithubRepoDetailPageState();
}

class _GithubRepoDetailPageState extends State<GithubRepoDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Hero(
              tag: widget.repo.fullName,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: CachedNetworkImageProvider(
                  widget.repo.owner.avatarUrlSmall,
                ),
                radius: 16,
              ),
            ),
            const SizedBox(width: 8),
            Flexible(child: Text(widget.repo.name)),
          ],
        ),
      ),
    );
  }
}
