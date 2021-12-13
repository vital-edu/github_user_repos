import 'package:dio/dio.dart';
import 'package:user_repo/core/infrastructure/remote_response.dart';
import 'package:user_repo/github/core/infrastructure/github_headers_cache.dart';
import 'package:user_repo/github/core/infrastructure/github_repo_dto.dart';
import 'package:user_repo/github/core/infrastructure/pagination_config.dart';
import 'package:user_repo/github/repos/core/infrastructure/repos_remote_service.dart';

class SearchedReposRemoteService extends ReposRemoteService {
  SearchedReposRemoteService(
    Dio dio,
    GithubHeadersCache headersCache,
  ) : super(dio, headersCache);

  Future<RemoteResponse<List<GithubRepoDTO>>> getSearchedReposPage({
    required String query,
    required int page,
  }) async =>
      super.getPage(
        requestUri: Uri.https(
          'api.github.com',
          '/user/starred',
          <String, String>{
            'q': query,
            'page': '$page',
            'per_page': PaginationConfig.itemsPerPage.toString(),
          },
        ),
        jsonDataSelector: (dynamic json) =>
            ((json as Map) as Map<String, dynamic>)['items'] as List<dynamic>,
      );
}
