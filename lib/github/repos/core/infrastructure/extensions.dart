import 'package:user_repo/github/core/domain/github_repo.dart';
import 'package:user_repo/github/core/infrastructure/github_repo_dto.dart';

extension DTOListToDomainList on List<GithubRepoDTO> {
  List<GithubRepo> toDomain() => map((e) => e.toDomain()).toList();
}
