import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:user_repo/core/presentation/toast.dart';
import 'package:user_repo/github/core/domain/github_repo.dart';
import 'package:user_repo/github/detail/application/github_repo_detail_notifier.dart';
import 'package:user_repo/github/shared/providers.dart';

class GithubRepoDetailPage extends ConsumerStatefulWidget {
  final GithubRepo repo;

  const GithubRepoDetailPage({Key? key, required this.repo}) : super(key: key);

  @override
  _GithubRepoDetailPageState createState() => _GithubRepoDetailPageState();
}

class _GithubRepoDetailPageState extends ConsumerState<GithubRepoDetailPage> {
  @override
  void initState() {
    super.initState();
    ref
        .read(repoDetailNotifierProvider.notifier)
        .getRepoDetail(widget.repo.fullName);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(repoDetailNotifierProvider);

    ref.listen<GithubRepoDetailState>(
      repoDetailNotifierProvider,
      (previous, next) => next.maybeMap(
        loadSuccess: (state) {
          if (!state.repoDetail.isFresh) {
            showNoConnectionToast(
              context: context,
              message: "You're not online. Some information may be outdated.",
            );
          }
        },
        orElse: () {},
      ),
    );

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
        actions: [
          state.maybeMap(
            orElse: () => Shimmer.fromColors(
              baseColor: Colors.grey.shade400,
              highlightColor: Colors.grey.shade300,
              child: IconButton(
                onPressed: null,
                icon: const Icon(Icons.star),
                disabledColor: Theme.of(context).iconTheme.color,
              ),
            ),
            loadSuccess: (data) => data.repoDetail.isFresh
                ? IconButton(
                    onPressed: () async => ref
                        .read(repoDetailNotifierProvider.notifier)
                        .swithStarredStatus(data.repoDetail.entity!),
                    icon: Icon(
                      data.repoDetail.entity?.starred == true
                          ? Icons.star
                          : Icons.star_outline,
                    ),
                    disabledColor: Theme.of(context).iconTheme.color,
                  )
                : const IconButton(
                    onPressed: null,
                    icon: Icon(MdiIcons.starRemoveOutline),
                  ),
          )
        ],
      ),
    );
  }
}
