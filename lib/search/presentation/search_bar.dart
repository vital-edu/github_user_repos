import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingSearchBar(
      builder: (context, _) => Container(),
      body: widget.body,
      title: Column(
        children: [
          Text(widget.title),
          Text('tap to search'),
        ],
      ),
      hint: widget.hint,
      leadingActions: [
        IconButton(
          onPressed: widget.onSignOutButtonPressed,
          icon: const Icon(MdiIcons.logoutVariant),
        )
      ],
      onSubmitted: widget.onShouldNavigateToResultPage,
    );
  }
}
