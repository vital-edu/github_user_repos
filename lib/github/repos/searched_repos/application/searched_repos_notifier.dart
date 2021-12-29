import 'package:user_repo/github/core/application/paginated_repos_notifier.dart';
import 'package:user_repo/github/repos/searched_repos/infrastructure/searched_repos_repository.dart';

class SearchedReposNotifier extends PaginatedReposNotifier {
  final SearchedReposRepository _repository;

  SearchedReposNotifier(this._repository);

  Future<void> getNextSearchedReposPage(String query) async {
    super.getNextPage(
      (page) => _repository.getSearchedReposPage(query: query, page: page),
    );
  }
}
