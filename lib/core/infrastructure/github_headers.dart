import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_headers.freezed.dart';

@freezed
class GithubHeaders with _$GithubHeaders {
  const factory GithubHeaders({
    String? etag,
  }) = _GithubHeaders;

  factory GithubHeaders.parse(Response response) {
    return GithubHeaders(etag: response.headers.value('etag'));
  }
}
