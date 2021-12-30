// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'github_repo_detail_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GithubRepoDetailDTO _$GithubRepoDetailDTOFromJson(Map<String, dynamic> json) {
  return _GithubRepoDetailDTO.fromJson(json);
}

/// @nodoc
class _$GithubRepoDetailDTOTearOff {
  const _$GithubRepoDetailDTOTearOff();

  _GithubRepoDetailDTO call(
      {required String fullname, required String html, required bool starred}) {
    return _GithubRepoDetailDTO(
      fullname: fullname,
      html: html,
      starred: starred,
    );
  }

  GithubRepoDetailDTO fromJson(Map<String, Object> json) {
    return GithubRepoDetailDTO.fromJson(json);
  }
}

/// @nodoc
const $GithubRepoDetailDTO = _$GithubRepoDetailDTOTearOff();

/// @nodoc
mixin _$GithubRepoDetailDTO {
  String get fullname => throw _privateConstructorUsedError;
  String get html => throw _privateConstructorUsedError;
  bool get starred => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GithubRepoDetailDTOCopyWith<GithubRepoDetailDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GithubRepoDetailDTOCopyWith<$Res> {
  factory $GithubRepoDetailDTOCopyWith(
          GithubRepoDetailDTO value, $Res Function(GithubRepoDetailDTO) then) =
      _$GithubRepoDetailDTOCopyWithImpl<$Res>;
  $Res call({String fullname, String html, bool starred});
}

/// @nodoc
class _$GithubRepoDetailDTOCopyWithImpl<$Res>
    implements $GithubRepoDetailDTOCopyWith<$Res> {
  _$GithubRepoDetailDTOCopyWithImpl(this._value, this._then);

  final GithubRepoDetailDTO _value;
  // ignore: unused_field
  final $Res Function(GithubRepoDetailDTO) _then;

  @override
  $Res call({
    Object? fullname = freezed,
    Object? html = freezed,
    Object? starred = freezed,
  }) {
    return _then(_value.copyWith(
      fullname: fullname == freezed
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String,
      html: html == freezed
          ? _value.html
          : html // ignore: cast_nullable_to_non_nullable
              as String,
      starred: starred == freezed
          ? _value.starred
          : starred // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$GithubRepoDetailDTOCopyWith<$Res>
    implements $GithubRepoDetailDTOCopyWith<$Res> {
  factory _$GithubRepoDetailDTOCopyWith(_GithubRepoDetailDTO value,
          $Res Function(_GithubRepoDetailDTO) then) =
      __$GithubRepoDetailDTOCopyWithImpl<$Res>;
  @override
  $Res call({String fullname, String html, bool starred});
}

/// @nodoc
class __$GithubRepoDetailDTOCopyWithImpl<$Res>
    extends _$GithubRepoDetailDTOCopyWithImpl<$Res>
    implements _$GithubRepoDetailDTOCopyWith<$Res> {
  __$GithubRepoDetailDTOCopyWithImpl(
      _GithubRepoDetailDTO _value, $Res Function(_GithubRepoDetailDTO) _then)
      : super(_value, (v) => _then(v as _GithubRepoDetailDTO));

  @override
  _GithubRepoDetailDTO get _value => super._value as _GithubRepoDetailDTO;

  @override
  $Res call({
    Object? fullname = freezed,
    Object? html = freezed,
    Object? starred = freezed,
  }) {
    return _then(_GithubRepoDetailDTO(
      fullname: fullname == freezed
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String,
      html: html == freezed
          ? _value.html
          : html // ignore: cast_nullable_to_non_nullable
              as String,
      starred: starred == freezed
          ? _value.starred
          : starred // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GithubRepoDetailDTO extends _GithubRepoDetailDTO {
  const _$_GithubRepoDetailDTO(
      {required this.fullname, required this.html, required this.starred})
      : super._();

  factory _$_GithubRepoDetailDTO.fromJson(Map<String, dynamic> json) =>
      _$$_GithubRepoDetailDTOFromJson(json);

  @override
  final String fullname;
  @override
  final String html;
  @override
  final bool starred;

  @override
  String toString() {
    return 'GithubRepoDetailDTO(fullname: $fullname, html: $html, starred: $starred)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GithubRepoDetailDTO &&
            (identical(other.fullname, fullname) ||
                const DeepCollectionEquality()
                    .equals(other.fullname, fullname)) &&
            (identical(other.html, html) ||
                const DeepCollectionEquality().equals(other.html, html)) &&
            (identical(other.starred, starred) ||
                const DeepCollectionEquality().equals(other.starred, starred)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(fullname) ^
      const DeepCollectionEquality().hash(html) ^
      const DeepCollectionEquality().hash(starred);

  @JsonKey(ignore: true)
  @override
  _$GithubRepoDetailDTOCopyWith<_GithubRepoDetailDTO> get copyWith =>
      __$GithubRepoDetailDTOCopyWithImpl<_GithubRepoDetailDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GithubRepoDetailDTOToJson(this);
  }
}

abstract class _GithubRepoDetailDTO extends GithubRepoDetailDTO {
  const factory _GithubRepoDetailDTO(
      {required String fullname,
      required String html,
      required bool starred}) = _$_GithubRepoDetailDTO;
  const _GithubRepoDetailDTO._() : super._();

  factory _GithubRepoDetailDTO.fromJson(Map<String, dynamic> json) =
      _$_GithubRepoDetailDTO.fromJson;

  @override
  String get fullname => throw _privateConstructorUsedError;
  @override
  String get html => throw _privateConstructorUsedError;
  @override
  bool get starred => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GithubRepoDetailDTOCopyWith<_GithubRepoDetailDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
