import 'package:sembast/sembast.dart';
import 'package:sembast/timestamp.dart';
import 'package:user_repo/github/core/infrastructure/github_headers_cache.dart';
import 'package:user_repo/github/core/infrastructure/sembast_database.dart';
import 'package:user_repo/github/detail/infrastructure/github_repo_detail_dto.dart';

class GithubRepoDetailLocalService {
  static const _cacheSize = 50;

  final SembastDatabase _databaseClient;
  final GithubHeadersCache _headersCache;
  final _store = stringMapStoreFactory.store('repoDetails');

  GithubRepoDetailLocalService(this._databaseClient, this._headersCache);

  Future<void> upsertRepoDetail(GithubRepoDetailDTO model) async {
    await _store
        .record(model.fullName)
        .put(_databaseClient.instance, model.toSembast());

    await _databaseClient.instance.transaction((transaction) async {
      final keys = await _store.findKeys(
        transaction,
        finder: Finder(
          sortOrders: [
            SortOrder(GithubRepoDetailDTO.lastUsedAtFieldName, false),
          ],
          offset: _cacheSize,
        ),
      );

      for (final key in keys) {
        await _store.record(key).delete(transaction);
        await _headersCache.deleteHeaders(
          Uri(
            host: 'api.github.com',
            path: '/repos/$key/readme',
          ),
        );
      }
    });
  }

  Future<GithubRepoDetailDTO?> getRepoDetail(String fullRepoName) async {
    final record = _store.record(fullRepoName);

    final result =
        await _databaseClient.instance.transaction((transaction) async {
      await record.update(transaction, {
        GithubRepoDetailDTO.lastUsedAtFieldName: Timestamp.now(),
      });
      return record.getSnapshot(transaction);
    });

    if (result == null) return null;

    return GithubRepoDetailDTO.fromSembast(result);
  }
}
