import 'package:collection/collection.dart';
import 'package:sembast/sembast.dart';
import 'package:user_repo/github/core/infrastructure/github_repo_dto.dart';
import 'package:user_repo/github/core/infrastructure/pagination_config.dart';
import 'package:user_repo/github/core/infrastructure/sembast_database.dart';

class StarredReposLocalService {
  final SembastDatabase _database;
  final _store = intMapStoreFactory.store('starredRepos');

  StarredReposLocalService(this._database);

  Future<void> upsertPage(List<GithubRepoDTO> dtos, int page) async {
    final dbPage = page - 1;

    await _store
        .records(
          dtos.mapIndexed(
            (index, _) => index + dbPage * PaginationConfig.itemsPerPage,
          ),
        )
        .put(_database.instance, dtos.map((e) => e.toJson()).toList());
  }

  Future<List<GithubRepoDTO>> getPage(int page) async {
    final dbPage = page - 1;

    final records = await _store.find(
      _database.instance,
      finder: Finder(
        limit: PaginationConfig.itemsPerPage,
        offset: PaginationConfig.itemsPerPage * dbPage,
      ),
    );

    return records.map((e) => GithubRepoDTO.fromJson(e.value)).toList();
  }

  Future<int> getLocalPageCount() async {
    final repoCount = await _store.count(_database.instance);
    return (repoCount / PaginationConfig.itemsPerPage).ceil();
  }
}
