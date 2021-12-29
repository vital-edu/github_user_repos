import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_repo/core/shared/providers.dart';
import 'package:user_repo/search/application/search_history_notifier.dart';
import 'package:user_repo/search/infrastructure/search_history_repository.dart';

final searchHistoryRepositoryProvider = Provider(
  (ref) => SearchHistoryRepository(
    ref.watch(sembastDatabaseProvider),
  ),
);

final searchHistoryNotifierProvider =
    StateNotifierProvider<SearchHistoryNotifier, AsyncValue<List<String>>>(
  (ref) => SearchHistoryNotifier(ref.watch(searchHistoryRepositoryProvider)),
);
