// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'github_repo_detail_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GithubRepoDetailStateTearOff {
  const _$GithubRepoDetailStateTearOff();

  _Initial initial({bool hasStarredStatusChanged = false}) {
    return _Initial(
      hasStarredStatusChanged: hasStarredStatusChanged,
    );
  }

  _LoadInProgress loadInProgress({bool hasStarredStatusChanged = false}) {
    return _LoadInProgress(
      hasStarredStatusChanged: hasStarredStatusChanged,
    );
  }

  _LoadFailure loadFailure(GithubFailure failure,
      {bool hasStarredStatusChanged = false}) {
    return _LoadFailure(
      failure,
      hasStarredStatusChanged: hasStarredStatusChanged,
    );
  }

  _LoadSuccess loadSuccess(Fresh<GithubRepoDetail?> data,
      {bool hasStarredStatusChanged = false}) {
    return _LoadSuccess(
      data,
      hasStarredStatusChanged: hasStarredStatusChanged,
    );
  }
}

/// @nodoc
const $GithubRepoDetailState = _$GithubRepoDetailStateTearOff();

/// @nodoc
mixin _$GithubRepoDetailState {
  bool get hasStarredStatusChanged => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool hasStarredStatusChanged) initial,
    required TResult Function(bool hasStarredStatusChanged) loadInProgress,
    required TResult Function(
            GithubFailure failure, bool hasStarredStatusChanged)
        loadFailure,
    required TResult Function(
            Fresh<GithubRepoDetail?> data, bool hasStarredStatusChanged)
        loadSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool hasStarredStatusChanged)? initial,
    TResult Function(bool hasStarredStatusChanged)? loadInProgress,
    TResult Function(GithubFailure failure, bool hasStarredStatusChanged)?
        loadFailure,
    TResult Function(
            Fresh<GithubRepoDetail?> data, bool hasStarredStatusChanged)?
        loadSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool hasStarredStatusChanged)? initial,
    TResult Function(bool hasStarredStatusChanged)? loadInProgress,
    TResult Function(GithubFailure failure, bool hasStarredStatusChanged)?
        loadFailure,
    TResult Function(
            Fresh<GithubRepoDetail?> data, bool hasStarredStatusChanged)?
        loadSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadFailure value) loadFailure,
    required TResult Function(_LoadSuccess value) loadSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_LoadSuccess value)? loadSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_LoadSuccess value)? loadSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GithubRepoDetailStateCopyWith<GithubRepoDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GithubRepoDetailStateCopyWith<$Res> {
  factory $GithubRepoDetailStateCopyWith(GithubRepoDetailState value,
          $Res Function(GithubRepoDetailState) then) =
      _$GithubRepoDetailStateCopyWithImpl<$Res>;
  $Res call({bool hasStarredStatusChanged});
}

/// @nodoc
class _$GithubRepoDetailStateCopyWithImpl<$Res>
    implements $GithubRepoDetailStateCopyWith<$Res> {
  _$GithubRepoDetailStateCopyWithImpl(this._value, this._then);

  final GithubRepoDetailState _value;
  // ignore: unused_field
  final $Res Function(GithubRepoDetailState) _then;

  @override
  $Res call({
    Object? hasStarredStatusChanged = freezed,
  }) {
    return _then(_value.copyWith(
      hasStarredStatusChanged: hasStarredStatusChanged == freezed
          ? _value.hasStarredStatusChanged
          : hasStarredStatusChanged // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$InitialCopyWith<$Res>
    implements $GithubRepoDetailStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
  @override
  $Res call({bool hasStarredStatusChanged});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$GithubRepoDetailStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;

  @override
  $Res call({
    Object? hasStarredStatusChanged = freezed,
  }) {
    return _then(_Initial(
      hasStarredStatusChanged: hasStarredStatusChanged == freezed
          ? _value.hasStarredStatusChanged
          : hasStarredStatusChanged // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Initial extends _Initial {
  const _$_Initial({this.hasStarredStatusChanged = false}) : super._();

  @JsonKey(defaultValue: false)
  @override
  final bool hasStarredStatusChanged;

  @override
  String toString() {
    return 'GithubRepoDetailState.initial(hasStarredStatusChanged: $hasStarredStatusChanged)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Initial &&
            (identical(
                    other.hasStarredStatusChanged, hasStarredStatusChanged) ||
                const DeepCollectionEquality().equals(
                    other.hasStarredStatusChanged, hasStarredStatusChanged)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(hasStarredStatusChanged);

  @JsonKey(ignore: true)
  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool hasStarredStatusChanged) initial,
    required TResult Function(bool hasStarredStatusChanged) loadInProgress,
    required TResult Function(
            GithubFailure failure, bool hasStarredStatusChanged)
        loadFailure,
    required TResult Function(
            Fresh<GithubRepoDetail?> data, bool hasStarredStatusChanged)
        loadSuccess,
  }) {
    return initial(hasStarredStatusChanged);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool hasStarredStatusChanged)? initial,
    TResult Function(bool hasStarredStatusChanged)? loadInProgress,
    TResult Function(GithubFailure failure, bool hasStarredStatusChanged)?
        loadFailure,
    TResult Function(
            Fresh<GithubRepoDetail?> data, bool hasStarredStatusChanged)?
        loadSuccess,
  }) {
    return initial?.call(hasStarredStatusChanged);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool hasStarredStatusChanged)? initial,
    TResult Function(bool hasStarredStatusChanged)? loadInProgress,
    TResult Function(GithubFailure failure, bool hasStarredStatusChanged)?
        loadFailure,
    TResult Function(
            Fresh<GithubRepoDetail?> data, bool hasStarredStatusChanged)?
        loadSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(hasStarredStatusChanged);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadFailure value) loadFailure,
    required TResult Function(_LoadSuccess value) loadSuccess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_LoadSuccess value)? loadSuccess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_LoadSuccess value)? loadSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends GithubRepoDetailState {
  const factory _Initial({bool hasStarredStatusChanged}) = _$_Initial;
  const _Initial._() : super._();

  @override
  bool get hasStarredStatusChanged => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$InitialCopyWith<_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadInProgressCopyWith<$Res>
    implements $GithubRepoDetailStateCopyWith<$Res> {
  factory _$LoadInProgressCopyWith(
          _LoadInProgress value, $Res Function(_LoadInProgress) then) =
      __$LoadInProgressCopyWithImpl<$Res>;
  @override
  $Res call({bool hasStarredStatusChanged});
}

/// @nodoc
class __$LoadInProgressCopyWithImpl<$Res>
    extends _$GithubRepoDetailStateCopyWithImpl<$Res>
    implements _$LoadInProgressCopyWith<$Res> {
  __$LoadInProgressCopyWithImpl(
      _LoadInProgress _value, $Res Function(_LoadInProgress) _then)
      : super(_value, (v) => _then(v as _LoadInProgress));

  @override
  _LoadInProgress get _value => super._value as _LoadInProgress;

  @override
  $Res call({
    Object? hasStarredStatusChanged = freezed,
  }) {
    return _then(_LoadInProgress(
      hasStarredStatusChanged: hasStarredStatusChanged == freezed
          ? _value.hasStarredStatusChanged
          : hasStarredStatusChanged // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_LoadInProgress extends _LoadInProgress {
  const _$_LoadInProgress({this.hasStarredStatusChanged = false}) : super._();

  @JsonKey(defaultValue: false)
  @override
  final bool hasStarredStatusChanged;

  @override
  String toString() {
    return 'GithubRepoDetailState.loadInProgress(hasStarredStatusChanged: $hasStarredStatusChanged)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadInProgress &&
            (identical(
                    other.hasStarredStatusChanged, hasStarredStatusChanged) ||
                const DeepCollectionEquality().equals(
                    other.hasStarredStatusChanged, hasStarredStatusChanged)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(hasStarredStatusChanged);

  @JsonKey(ignore: true)
  @override
  _$LoadInProgressCopyWith<_LoadInProgress> get copyWith =>
      __$LoadInProgressCopyWithImpl<_LoadInProgress>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool hasStarredStatusChanged) initial,
    required TResult Function(bool hasStarredStatusChanged) loadInProgress,
    required TResult Function(
            GithubFailure failure, bool hasStarredStatusChanged)
        loadFailure,
    required TResult Function(
            Fresh<GithubRepoDetail?> data, bool hasStarredStatusChanged)
        loadSuccess,
  }) {
    return loadInProgress(hasStarredStatusChanged);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool hasStarredStatusChanged)? initial,
    TResult Function(bool hasStarredStatusChanged)? loadInProgress,
    TResult Function(GithubFailure failure, bool hasStarredStatusChanged)?
        loadFailure,
    TResult Function(
            Fresh<GithubRepoDetail?> data, bool hasStarredStatusChanged)?
        loadSuccess,
  }) {
    return loadInProgress?.call(hasStarredStatusChanged);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool hasStarredStatusChanged)? initial,
    TResult Function(bool hasStarredStatusChanged)? loadInProgress,
    TResult Function(GithubFailure failure, bool hasStarredStatusChanged)?
        loadFailure,
    TResult Function(
            Fresh<GithubRepoDetail?> data, bool hasStarredStatusChanged)?
        loadSuccess,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(hasStarredStatusChanged);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadFailure value) loadFailure,
    required TResult Function(_LoadSuccess value) loadSuccess,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_LoadSuccess value)? loadSuccess,
  }) {
    return loadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_LoadSuccess value)? loadSuccess,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class _LoadInProgress extends GithubRepoDetailState {
  const factory _LoadInProgress({bool hasStarredStatusChanged}) =
      _$_LoadInProgress;
  const _LoadInProgress._() : super._();

  @override
  bool get hasStarredStatusChanged => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LoadInProgressCopyWith<_LoadInProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadFailureCopyWith<$Res>
    implements $GithubRepoDetailStateCopyWith<$Res> {
  factory _$LoadFailureCopyWith(
          _LoadFailure value, $Res Function(_LoadFailure) then) =
      __$LoadFailureCopyWithImpl<$Res>;
  @override
  $Res call({GithubFailure failure, bool hasStarredStatusChanged});

  $GithubFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$LoadFailureCopyWithImpl<$Res>
    extends _$GithubRepoDetailStateCopyWithImpl<$Res>
    implements _$LoadFailureCopyWith<$Res> {
  __$LoadFailureCopyWithImpl(
      _LoadFailure _value, $Res Function(_LoadFailure) _then)
      : super(_value, (v) => _then(v as _LoadFailure));

  @override
  _LoadFailure get _value => super._value as _LoadFailure;

  @override
  $Res call({
    Object? failure = freezed,
    Object? hasStarredStatusChanged = freezed,
  }) {
    return _then(_LoadFailure(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as GithubFailure,
      hasStarredStatusChanged: hasStarredStatusChanged == freezed
          ? _value.hasStarredStatusChanged
          : hasStarredStatusChanged // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $GithubFailureCopyWith<$Res> get failure {
    return $GithubFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$_LoadFailure extends _LoadFailure {
  const _$_LoadFailure(this.failure, {this.hasStarredStatusChanged = false})
      : super._();

  @override
  final GithubFailure failure;
  @JsonKey(defaultValue: false)
  @override
  final bool hasStarredStatusChanged;

  @override
  String toString() {
    return 'GithubRepoDetailState.loadFailure(failure: $failure, hasStarredStatusChanged: $hasStarredStatusChanged)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadFailure &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality()
                    .equals(other.failure, failure)) &&
            (identical(
                    other.hasStarredStatusChanged, hasStarredStatusChanged) ||
                const DeepCollectionEquality().equals(
                    other.hasStarredStatusChanged, hasStarredStatusChanged)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(failure) ^
      const DeepCollectionEquality().hash(hasStarredStatusChanged);

  @JsonKey(ignore: true)
  @override
  _$LoadFailureCopyWith<_LoadFailure> get copyWith =>
      __$LoadFailureCopyWithImpl<_LoadFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool hasStarredStatusChanged) initial,
    required TResult Function(bool hasStarredStatusChanged) loadInProgress,
    required TResult Function(
            GithubFailure failure, bool hasStarredStatusChanged)
        loadFailure,
    required TResult Function(
            Fresh<GithubRepoDetail?> data, bool hasStarredStatusChanged)
        loadSuccess,
  }) {
    return loadFailure(failure, hasStarredStatusChanged);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool hasStarredStatusChanged)? initial,
    TResult Function(bool hasStarredStatusChanged)? loadInProgress,
    TResult Function(GithubFailure failure, bool hasStarredStatusChanged)?
        loadFailure,
    TResult Function(
            Fresh<GithubRepoDetail?> data, bool hasStarredStatusChanged)?
        loadSuccess,
  }) {
    return loadFailure?.call(failure, hasStarredStatusChanged);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool hasStarredStatusChanged)? initial,
    TResult Function(bool hasStarredStatusChanged)? loadInProgress,
    TResult Function(GithubFailure failure, bool hasStarredStatusChanged)?
        loadFailure,
    TResult Function(
            Fresh<GithubRepoDetail?> data, bool hasStarredStatusChanged)?
        loadSuccess,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(failure, hasStarredStatusChanged);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadFailure value) loadFailure,
    required TResult Function(_LoadSuccess value) loadSuccess,
  }) {
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_LoadSuccess value)? loadSuccess,
  }) {
    return loadFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_LoadSuccess value)? loadSuccess,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class _LoadFailure extends GithubRepoDetailState {
  const factory _LoadFailure(GithubFailure failure,
      {bool hasStarredStatusChanged}) = _$_LoadFailure;
  const _LoadFailure._() : super._();

  GithubFailure get failure => throw _privateConstructorUsedError;
  @override
  bool get hasStarredStatusChanged => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LoadFailureCopyWith<_LoadFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadSuccessCopyWith<$Res>
    implements $GithubRepoDetailStateCopyWith<$Res> {
  factory _$LoadSuccessCopyWith(
          _LoadSuccess value, $Res Function(_LoadSuccess) then) =
      __$LoadSuccessCopyWithImpl<$Res>;
  @override
  $Res call({Fresh<GithubRepoDetail?> data, bool hasStarredStatusChanged});

  $FreshCopyWith<GithubRepoDetail?, $Res> get data;
}

/// @nodoc
class __$LoadSuccessCopyWithImpl<$Res>
    extends _$GithubRepoDetailStateCopyWithImpl<$Res>
    implements _$LoadSuccessCopyWith<$Res> {
  __$LoadSuccessCopyWithImpl(
      _LoadSuccess _value, $Res Function(_LoadSuccess) _then)
      : super(_value, (v) => _then(v as _LoadSuccess));

  @override
  _LoadSuccess get _value => super._value as _LoadSuccess;

  @override
  $Res call({
    Object? data = freezed,
    Object? hasStarredStatusChanged = freezed,
  }) {
    return _then(_LoadSuccess(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Fresh<GithubRepoDetail?>,
      hasStarredStatusChanged: hasStarredStatusChanged == freezed
          ? _value.hasStarredStatusChanged
          : hasStarredStatusChanged // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $FreshCopyWith<GithubRepoDetail?, $Res> get data {
    return $FreshCopyWith<GithubRepoDetail?, $Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc

class _$_LoadSuccess extends _LoadSuccess {
  const _$_LoadSuccess(this.data, {this.hasStarredStatusChanged = false})
      : super._();

  @override
  final Fresh<GithubRepoDetail?> data;
  @JsonKey(defaultValue: false)
  @override
  final bool hasStarredStatusChanged;

  @override
  String toString() {
    return 'GithubRepoDetailState.loadSuccess(data: $data, hasStarredStatusChanged: $hasStarredStatusChanged)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadSuccess &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(
                    other.hasStarredStatusChanged, hasStarredStatusChanged) ||
                const DeepCollectionEquality().equals(
                    other.hasStarredStatusChanged, hasStarredStatusChanged)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(hasStarredStatusChanged);

  @JsonKey(ignore: true)
  @override
  _$LoadSuccessCopyWith<_LoadSuccess> get copyWith =>
      __$LoadSuccessCopyWithImpl<_LoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool hasStarredStatusChanged) initial,
    required TResult Function(bool hasStarredStatusChanged) loadInProgress,
    required TResult Function(
            GithubFailure failure, bool hasStarredStatusChanged)
        loadFailure,
    required TResult Function(
            Fresh<GithubRepoDetail?> data, bool hasStarredStatusChanged)
        loadSuccess,
  }) {
    return loadSuccess(data, hasStarredStatusChanged);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool hasStarredStatusChanged)? initial,
    TResult Function(bool hasStarredStatusChanged)? loadInProgress,
    TResult Function(GithubFailure failure, bool hasStarredStatusChanged)?
        loadFailure,
    TResult Function(
            Fresh<GithubRepoDetail?> data, bool hasStarredStatusChanged)?
        loadSuccess,
  }) {
    return loadSuccess?.call(data, hasStarredStatusChanged);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool hasStarredStatusChanged)? initial,
    TResult Function(bool hasStarredStatusChanged)? loadInProgress,
    TResult Function(GithubFailure failure, bool hasStarredStatusChanged)?
        loadFailure,
    TResult Function(
            Fresh<GithubRepoDetail?> data, bool hasStarredStatusChanged)?
        loadSuccess,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(data, hasStarredStatusChanged);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadFailure value) loadFailure,
    required TResult Function(_LoadSuccess value) loadSuccess,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_LoadSuccess value)? loadSuccess,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_LoadSuccess value)? loadSuccess,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoadSuccess extends GithubRepoDetailState {
  const factory _LoadSuccess(Fresh<GithubRepoDetail?> data,
      {bool hasStarredStatusChanged}) = _$_LoadSuccess;
  const _LoadSuccess._() : super._();

  Fresh<GithubRepoDetail?> get data => throw _privateConstructorUsedError;
  @override
  bool get hasStarredStatusChanged => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LoadSuccessCopyWith<_LoadSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}
