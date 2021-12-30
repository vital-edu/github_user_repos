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
  late FloatingSearchBarController _controller;

  @override
  void initState() {
    super.initState();
    _controller = FloatingSearchBarController();
    Future.microtask(
      () => ref.read(searchHistoryNotifierProvider.notifier).watchSearchTerms(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void pushPageAndAddToHistory(String searchedTerm) {
      widget.onShouldNavigateToResultPage(searchedTerm);
      ref
          .read(searchHistoryNotifierProvider.notifier)
          .addSearchTerm(searchedTerm);
      _controller.close();
    }

    void pushPageAndPutFirstInHistory(String searchedTerm) {
      widget.onShouldNavigateToResultPage(searchedTerm);
      ref
          .read(searchHistoryNotifierProvider.notifier)
          .putSearchTermFirst(searchedTerm);
      _controller.close();
    }

    return FloatingSearchBar(
      controller: _controller,
      builder: (context, _) {
        final searchHistoryState = ref.watch(searchHistoryNotifierProvider);
        return Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(8),
          clipBehavior: Clip.hardEdge,
          color: Theme.of(context).cardColor,
          child: searchHistoryState.map(
            data: (history) {
              if (history.value.isEmpty) {
                if (_controller.query.isEmpty) {
                  return Container(
                    alignment: Alignment.center,
                    height: 56,
                    child: Text(
                      'Start searching',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  );
                }

                return ListTile(
                  title: Text(_controller.query),
                  leading: const Icon(MdiIcons.magnify),
                  onTap: () => pushPageAndAddToHistory(_controller.query),
                );
              }

              return Column(
                children: history.value
                    .map(
                      (term) => ListTile(
                        title: Text(term),
                        leading: const Icon(Icons.history),
                        trailing: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () => ref
                              .read(searchHistoryNotifierProvider.notifier)
                              .deleteSearchTerm(term),
                        ),
                        onTap: () => pushPageAndPutFirstInHistory(term),
                      ),
                    )
                    .toList(),
              );
            },
            error: (error) => ListTile(title: Text(error.toString())),
            loading: (_) => const ListTile(title: LinearProgressIndicator()),
          ),
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
      onSubmitted: pushPageAndAddToHistory,
      onQueryChanged: (query) => ref
          .read(searchHistoryNotifierProvider.notifier)
          .watchSearchTerms(filter: query),
    );
  }
}
