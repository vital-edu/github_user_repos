import 'package:sembast/sembast.dart';
import 'package:user_repo/github/core/infrastructure/github_headers.dart';
import 'package:user_repo/github/core/infrastructure/sembast_database.dart';

class GithubHeadersCache {
  final _store = stringMapStoreFactory.store('headers');
  final SembastDatabase _client;

  GithubHeadersCache(this._client);

  Future<void> saveHeaders(Uri uri, GithubHeaders headers) async {
    await _store.record(uri.toString()).put(_client.instance, headers.toJson());
  }

  Future<void> deleteHeaders(Uri uri) async {
    await _store.record(uri.toString()).delete(_client.instance);
  }

  Future<GithubHeaders?> getHeaders(Uri uri) async {
    final json = await _store.record(uri.toString()).get(_client.instance);
    return json == null ? null : GithubHeaders.fromJson(json);
  }
}
