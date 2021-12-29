import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:user_repo/search/shared/providers.dart';

class SearchBar extends ConsumerStatefulWidget {
  final String title;
  final String hint;
  final Widget body;
  final Function(String searchedTerm) onShouldNavigateToResultPage;
  final Function() onSignOutButtonPressed;

  const SearchBar({
    required this.title,
    required this.hint,
    required this.body,
    required this.onShouldNavigateToResultPage,
    required this.onSignOutButtonPressed,
  });

  @override
  ConsumerState<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends ConsumerState<SearchBar> {
  final _controller = FloatingSearchBarController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingSearchBar(
      controller: _controller,
      builder: (context, _) {
        final searchHistoryState = ref.watch(searchHistoryNotifierProvider);
        return searchHistoryState.map(
          data: (data) => Column(
            children: data.value
                .map(
                  (e) => ListTile(
                    title: Text(e),
                  ),
                )
                .toList(),
          ),
          error: (error) => ListTile(title: Text(error.toString())),
          loading: (_) => const ListTile(title: LinearProgressIndicator()),
        );
      },
      body: FloatingSearchBarScrollNotifier(child: widget.body),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.title,
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            'Tap to search 👆',
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
      hint: widget.hint,
      actions: [
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
        FloatingSearchBarAction(
          child: IconButton(
            icon: const Icon(MdiIcons.logoutVariant),
            onPressed: widget.onSignOutButtonPressed,
            splashRadius: 20,
          ),
        )
      ],
      onSubmitted: (term) {
        _controller.close();
        ref.read(searchHistoryNotifierProvider.notifier).addSearchTerm(term);
        widget.onShouldNavigateToResultPage(term);
      },
      onQueryChanged:
          ref.read(searchHistoryNotifierProvider.notifier).watchSearchTerms,
    );
  }
}
