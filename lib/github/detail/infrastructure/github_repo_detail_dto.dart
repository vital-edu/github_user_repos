import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sembast/sembast.dart';
import 'package:user_repo/github/detail/domain/github_repo_detail.dart';

part 'github_repo_detail_dto.freezed.dart';
part 'github_repo_detail_dto.g.dart';

@freezed
class GithubRepoDetailDTO with _$GithubRepoDetailDTO {
  const GithubRepoDetailDTO._();
  const factory GithubRepoDetailDTO({
    required String fullname,
    required String html,
    required bool starred,
  }) = _GithubRepoDetailDTO;

  factory GithubRepoDetailDTO.fromJson(Map<String, dynamic> json) =>
      _$GithubRepoDetailDTOFromJson(json);

  factory GithubRepoDetailDTO.fromDomain(GithubRepoDetail _) =>
      GithubRepoDetailDTO(
        fullname: _.fullname,
        html: _.html,
        starred: _.starred,
      );

  GithubRepoDetail toDomain() => GithubRepoDetail(
        fullname: fullname,
        html: html,
        starred: starred,
      );

  Map<String, dynamic> toSembast() {
    final json = toJson();
    json.remove('fullname');
    return json;
  }

  factory GithubRepoDetailDTO.fromSembast(
    RecordSnapshot<String, Map<String, dynamic>> snapshot,
  ) {
    return GithubRepoDetailDTO.fromJson(<String, dynamic>{
      'fullname': snapshot.key,
      ...snapshot.value,
    });
  }
}
