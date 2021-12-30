import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sembast/sembast.dart';
import 'package:user_repo/github/detail/domain/github_repo_detail.dart';

part 'github_repo_detail_dto.freezed.dart';
part 'github_repo_detail_dto.g.dart';

@freezed
class GithubRepoDetailDTO with _$GithubRepoDetailDTO {
  const GithubRepoDetailDTO._();
  const factory GithubRepoDetailDTO({
    required String fullName,
    required String html,
    required bool starred,
  }) = _GithubRepoDetailDTO;

  factory GithubRepoDetailDTO.fromJson(Map<String, dynamic> json) =>
      _$GithubRepoDetailDTOFromJson(json);

  factory GithubRepoDetailDTO.fromDomain(GithubRepoDetail _) =>
      GithubRepoDetailDTO(
        fullName: _.fullName,
        html: _.html,
        starred: _.starred,
      );

  GithubRepoDetail toDomain() => GithubRepoDetail(
        fullName: fullName,
        html: html,
        starred: starred,
      );

  Map<String, dynamic> toSembast() {
    final json = toJson();
    json.remove('fullName');
    return json;
  }

  factory GithubRepoDetailDTO.fromSembast(
    RecordSnapshot<String, Map<String, dynamic>> snapshot,
  ) {
    return GithubRepoDetailDTO.fromJson(<String, dynamic>{
      'fullName': snapshot.key,
      ...snapshot.value,
    });
  }
}
