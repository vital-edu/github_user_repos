import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_headers.freezed.dart';
part 'github_headers.g.dart';

@freezed
class GithubHeaders with _$GithubHeaders {
  const factory GithubHeaders({
    String? etag,
    PaginationLink? link,
  }) = _GithubHeaders;

  factory GithubHeaders.parse(Response response) {
    final link = response.headers.value('link');
    return GithubHeaders(
      etag: response.headers.value('etag'),
      link: link == null
          ? null
          : PaginationLink.parse(
              link.split(','),
              requestUrl: response.requestOptions.uri.toString(),
            ),
    );
  }

  factory GithubHeaders.fromJson(Map<String, dynamic> json) =>
      _$GithubHeadersFromJson(json);
}

@freezed
class PaginationLink with _$PaginationLink {
  const factory PaginationLink({
    required int maxPage,
  }) = _PaginationLink;

  factory PaginationLink.parse(
    List<String> values, {
    required String requestUrl,
  }) =>
      PaginationLink(
        maxPage: _extractPageNumber(
          values.firstWhere(
            (element) => element.contains('rel="last"'),
            orElse: () => requestUrl,
          ),
        ),
      );

  static int _extractPageNumber(String value) {
    final lastPageRegex = RegExp(r'page=(\d+)', caseSensitive: false);
    final page = lastPageRegex.firstMatch(value)?.group(1);

    return int.tryParse(page.toString())!;
  }

  factory PaginationLink.fromJson(Map<String, dynamic> json) =>
      _$PaginationLinkFromJson(json);
}
