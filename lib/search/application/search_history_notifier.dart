import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_repo/search/infrastructure/search_history_repository.dart';

class SearchHistoryNotifier extends StateNotifier<AsyncValue<List<String>>> {
  final SearchHistoryRepository _repository;

  SearchHistoryNotifier(this._repository) : super(const AsyncValue.loading());

  void watchSearchTerms({String? filter}) {
    _repository.watchSearchTerms(filter: filter).listen(
      (event) {
        state = AsyncValue.data(event);
      },
      onError: (Object error) {
        state = AsyncValue.error(error);
      },
    );
  }

  Future<void> addSearchTerm(String term) => _repository.addSearchTerm(term);

  Future<void> deleteSearchTerm(String term) =>
      _repository.deleteSearchTerm(term);

  Future<void> putSearchTermFirst(String term) =>
      _repository.putSearchTermFirst(term);
}
