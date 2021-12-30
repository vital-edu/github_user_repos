import 'package:sembast/sembast.dart';
import 'package:sembast/timestamp.dart';
import 'package:user_repo/github/core/infrastructure/sembast_database.dart';
import 'package:user_repo/github/detail/infrastructure/github_repo_detail_dto.dart';

class GithubRepoDetailLocalService {
  static const _cacheSize = 50;

  final SembastDatabase _databaseClient;
  final _store = stringMapStoreFactory.store('repoDetails');

  GithubRepoDetailLocalService(this._databaseClient);

  Future<void> upsertRepoDetail(GithubRepoDetailDTO model) async {
    await _store
        .record(model.fullName)
        .put(_databaseClient.instance, model.toSembast());
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
