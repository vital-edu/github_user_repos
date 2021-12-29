import 'package:sembast/sembast.dart';
import 'package:user_repo/github/core/infrastructure/sembast_database.dart';

class SearchHistoryRepository {
  final SembastDatabase _database;
  final _store = StoreRef<int, String>('search_history');

  SearchHistoryRepository(this._database);

  static const historyLength = 10;

  Stream<List<String>> watchSearchTerms({String? filter}) {
    return _store
        .query(
          finder: filter != null && filter.isNotEmpty
              ? Finder(
                  filter: Filter.custom(
                    (record) => (record.value as String).startsWith(filter),
                  ),
                )
              : null,
        )
        .onSnapshots(_database.instance)
        .map((event) => event.reversed.map((e) => e.value).toList());
  }

  Future<void> addSearchTerm(String term) =>
      _addSearchTerm(term, dbClient: _database.instance);

  Future<void> deleteSearchTerm(String term) =>
      _deleteSearchTerm(term, dbClient: _database.instance);

  Future<void> putSearchTermFirst(String term) async {
    await _database.instance.transaction((transaction) async {
      await _deleteSearchTerm(term, dbClient: transaction);
      await _addSearchTerm(term, dbClient: transaction);
    });
  }

  Future<void> _addSearchTerm(
    String term, {
    required DatabaseClient dbClient,
  }) async {
    final existingKey = await _store.findKey(
      dbClient,
      finder: Finder(filter: Filter.custom((record) => record.value == term)),
    );

    if (existingKey != null) {
      return putSearchTermFirst(term);
    }

    await _store.add(dbClient, term);

    final termsCount = await _store.count(dbClient);
    if (termsCount > historyLength) {
      await _store.delete(
        dbClient,
        finder: Finder(
          limit: termsCount - historyLength,
        ),
      );
    }
  }

  Future<void> _deleteSearchTerm(
    String term, {
    required DatabaseClient dbClient,
  }) async {
    await _store.delete(
      dbClient,
      finder: Finder(
        filter: Filter.custom((record) => record.value == term),
      ),
    );
  }
}
