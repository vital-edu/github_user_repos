// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'paginated_repos_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PaginatedReposStateTearOff {
  const _$PaginatedReposStateTearOff();

  _Initial initial(Fresh<List<GithubRepo>> repos) {
    return _Initial(
      repos,
    );
  }

  _LoadInProgress loadInProgress(
      Fresh<List<GithubRepo>> repos, int itemsPerPage) {
    return _LoadInProgress(
      repos,
      itemsPerPage,
    );
  }

  _LoadSuccess loadSuccess(Fresh<List<GithubRepo>> repos,
      {required bool isNextPageAvailable}) {
    return _LoadSuccess(
      repos,
      isNextPageAvailable: isNextPageAvailable,
    );
  }

  _HasFailure hasFailure(Fresh<List<GithubRepo>> repos, GithubFailure failure) {
    return _HasFailure(
      repos,
      failure,
    );
  }
}

/// @nodoc
const $PaginatedReposState = _$PaginatedReposStateTearOff();

/// @nodoc
mixin _$PaginatedReposState {
  Fresh<List<GithubRepo>> get repos => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<GithubRepo>> repos) initial,
    required TResult Function(Fresh<List<GithubRepo>> repos, int itemsPerPage)
        loadInProgress,
    required TResult Function(
            Fresh<List<GithubRepo>> repos, bool isNextPageAvailable)
        loadSuccess,
    required TResult Function(
            Fresh<List<GithubRepo>> repos, GithubFailure failure)
        hasFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Fresh<List<GithubRepo>> repos)? initial,
    TResult Function(Fresh<List<GithubRepo>> repos, int itemsPerPage)?
        loadInProgress,
    TResult Function(Fresh<List<GithubRepo>> repos, bool isNextPageAvailable)?
        loadSuccess,
    TResult Function(Fresh<List<GithubRepo>> repos, GithubFailure failure)?
        hasFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<GithubRepo>> repos)? initial,
    TResult Function(Fresh<List<GithubRepo>> repos, int itemsPerPage)?
        loadInProgress,
    TResult Function(Fresh<List<GithubRepo>> repos, bool isNextPageAvailable)?
        loadSuccess,
    TResult Function(Fresh<List<GithubRepo>> repos, GithubFailure failure)?
        hasFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_HasFailure value) hasFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_HasFailure value)? hasFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_HasFailure value)? hasFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaginatedReposStateCopyWith<PaginatedReposState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedReposStateCopyWith<$Res> {
  factory $PaginatedReposStateCopyWith(
          PaginatedReposState value, $Res Function(PaginatedReposState) then) =
      _$PaginatedReposStateCopyWithImpl<$Res>;
  $Res call({Fresh<List<GithubRepo>> repos});

  $FreshCopyWith<List<GithubRepo>, $Res> get repos;
}

/// @nodoc
class _$PaginatedReposStateCopyWithImpl<$Res>
    implements $PaginatedReposStateCopyWith<$Res> {
  _$PaginatedReposStateCopyWithImpl(this._value, this._then);

  final PaginatedReposState _value;
  // ignore: unused_field
  final $Res Function(PaginatedReposState) _then;

  @override
  $Res call({
    Object? repos = freezed,
  }) {
    return _then(_value.copyWith(
      repos: repos == freezed
          ? _value.repos
          : repos // ignore: cast_nullable_to_non_nullable
              as Fresh<List<GithubRepo>>,
    ));
  }

  @override
  $FreshCopyWith<List<GithubRepo>, $Res> get repos {
    return $FreshCopyWith<List<GithubRepo>, $Res>(_value.repos, (value) {
      return _then(_value.copyWith(repos: value));
    });
  }
}

/// @nodoc
abstract class _$InitialCopyWith<$Res>
    implements $PaginatedReposStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
  @override
  $Res call({Fresh<List<GithubRepo>> repos});

  @override
  $FreshCopyWith<List<GithubRepo>, $Res> get repos;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$PaginatedReposStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;

  @override
  $Res call({
    Object? repos = freezed,
  }) {
    return _then(_Initial(
      repos == freezed
          ? _value.repos
          : repos // ignore: cast_nullable_to_non_nullable
              as Fresh<List<GithubRepo>>,
    ));
  }
}

/// @nodoc

class _$_Initial extends _Initial {
  const _$_Initial(this.repos) : super._();

  @override
  final Fresh<List<GithubRepo>> repos;

  @override
  String toString() {
    return 'PaginatedReposState.initial(repos: $repos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Initial &&
            (identical(other.repos, repos) ||
                const DeepCollectionEquality().equals(other.repos, repos)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(repos);

  @JsonKey(ignore: true)
  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<GithubRepo>> repos) initial,
    required TResult Function(Fresh<List<GithubRepo>> repos, int itemsPerPage)
        loadInProgress,
    required TResult Function(
            Fresh<List<GithubRepo>> repos, bool isNextPageAvailable)
        loadSuccess,
    required TResult Function(
            Fresh<List<GithubRepo>> repos, GithubFailure failure)
        hasFailure,
  }) {
    return initial(repos);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Fresh<List<GithubRepo>> repos)? initial,
    TResult Function(Fresh<List<GithubRepo>> repos, int itemsPerPage)?
        loadInProgress,
    TResult Function(Fresh<List<GithubRepo>> repos, bool isNextPageAvailable)?
        loadSuccess,
    TResult Function(Fresh<List<GithubRepo>> repos, GithubFailure failure)?
        hasFailure,
  }) {
    return initial?.call(repos);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<GithubRepo>> repos)? initial,
    TResult Function(Fresh<List<GithubRepo>> repos, int itemsPerPage)?
        loadInProgress,
    TResult Function(Fresh<List<GithubRepo>> repos, bool isNextPageAvailable)?
        loadSuccess,
    TResult Function(Fresh<List<GithubRepo>> repos, GithubFailure failure)?
        hasFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(repos);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_HasFailure value) hasFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_HasFailure value)? hasFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_HasFailure value)? hasFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends PaginatedReposState {
  const factory _Initial(Fresh<List<GithubRepo>> repos) = _$_Initial;
  const _Initial._() : super._();

  @override
  Fresh<List<GithubRepo>> get repos => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$InitialCopyWith<_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadInProgressCopyWith<$Res>
    implements $PaginatedReposStateCopyWith<$Res> {
  factory _$LoadInProgressCopyWith(
          _LoadInProgress value, $Res Function(_LoadInProgress) then) =
      __$LoadInProgressCopyWithImpl<$Res>;
  @override
  $Res call({Fresh<List<GithubRepo>> repos, int itemsPerPage});

  @override
  $FreshCopyWith<List<GithubRepo>, $Res> get repos;
}

/// @nodoc
class __$LoadInProgressCopyWithImpl<$Res>
    extends _$PaginatedReposStateCopyWithImpl<$Res>
    implements _$LoadInProgressCopyWith<$Res> {
  __$LoadInProgressCopyWithImpl(
      _LoadInProgress _value, $Res Function(_LoadInProgress) _then)
      : super(_value, (v) => _then(v as _LoadInProgress));

  @override
  _LoadInProgress get _value => super._value as _LoadInProgress;

  @override
  $Res call({
    Object? repos = freezed,
    Object? itemsPerPage = freezed,
  }) {
    return _then(_LoadInProgress(
      repos == freezed
          ? _value.repos
          : repos // ignore: cast_nullable_to_non_nullable
              as Fresh<List<GithubRepo>>,
      itemsPerPage == freezed
          ? _value.itemsPerPage
          : itemsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_LoadInProgress extends _LoadInProgress {
  const _$_LoadInProgress(this.repos, this.itemsPerPage) : super._();

  @override
  final Fresh<List<GithubRepo>> repos;
  @override
  final int itemsPerPage;

  @override
  String toString() {
    return 'PaginatedReposState.loadInProgress(repos: $repos, itemsPerPage: $itemsPerPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadInProgress &&
            (identical(other.repos, repos) ||
                const DeepCollectionEquality().equals(other.repos, repos)) &&
            (identical(other.itemsPerPage, itemsPerPage) ||
                const DeepCollectionEquality()
                    .equals(other.itemsPerPage, itemsPerPage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(repos) ^
      const DeepCollectionEquality().hash(itemsPerPage);

  @JsonKey(ignore: true)
  @override
  _$LoadInProgressCopyWith<_LoadInProgress> get copyWith =>
      __$LoadInProgressCopyWithImpl<_LoadInProgress>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<GithubRepo>> repos) initial,
    required TResult Function(Fresh<List<GithubRepo>> repos, int itemsPerPage)
        loadInProgress,
    required TResult Function(
            Fresh<List<GithubRepo>> repos, bool isNextPageAvailable)
        loadSuccess,
    required TResult Function(
            Fresh<List<GithubRepo>> repos, GithubFailure failure)
        hasFailure,
  }) {
    return loadInProgress(repos, itemsPerPage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Fresh<List<GithubRepo>> repos)? initial,
    TResult Function(Fresh<List<GithubRepo>> repos, int itemsPerPage)?
        loadInProgress,
    TResult Function(Fresh<List<GithubRepo>> repos, bool isNextPageAvailable)?
        loadSuccess,
    TResult Function(Fresh<List<GithubRepo>> repos, GithubFailure failure)?
        hasFailure,
  }) {
    return loadInProgress?.call(repos, itemsPerPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<GithubRepo>> repos)? initial,
    TResult Function(Fresh<List<GithubRepo>> repos, int itemsPerPage)?
        loadInProgress,
    TResult Function(Fresh<List<GithubRepo>> repos, bool isNextPageAvailable)?
        loadSuccess,
    TResult Function(Fresh<List<GithubRepo>> repos, GithubFailure failure)?
        hasFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(repos, itemsPerPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_HasFailure value) hasFailure,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_HasFailure value)? hasFailure,
  }) {
    return loadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_HasFailure value)? hasFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class _LoadInProgress extends PaginatedReposState {
  const factory _LoadInProgress(
      Fresh<List<GithubRepo>> repos, int itemsPerPage) = _$_LoadInProgress;
  const _LoadInProgress._() : super._();

  @override
  Fresh<List<GithubRepo>> get repos => throw _privateConstructorUsedError;
  int get itemsPerPage => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LoadInProgressCopyWith<_LoadInProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadSuccessCopyWith<$Res>
    implements $PaginatedReposStateCopyWith<$Res> {
  factory _$LoadSuccessCopyWith(
          _LoadSuccess value, $Res Function(_LoadSuccess) then) =
      __$LoadSuccessCopyWithImpl<$Res>;
  @override
  $Res call({Fresh<List<GithubRepo>> repos, bool isNextPageAvailable});

  @override
  $FreshCopyWith<List<GithubRepo>, $Res> get repos;
}

/// @nodoc
class __$LoadSuccessCopyWithImpl<$Res>
    extends _$PaginatedReposStateCopyWithImpl<$Res>
    implements _$LoadSuccessCopyWith<$Res> {
  __$LoadSuccessCopyWithImpl(
      _LoadSuccess _value, $Res Function(_LoadSuccess) _then)
      : super(_value, (v) => _then(v as _LoadSuccess));

  @override
  _LoadSuccess get _value => super._value as _LoadSuccess;

  @override
  $Res call({
    Object? repos = freezed,
    Object? isNextPageAvailable = freezed,
  }) {
    return _then(_LoadSuccess(
      repos == freezed
          ? _value.repos
          : repos // ignore: cast_nullable_to_non_nullable
              as Fresh<List<GithubRepo>>,
      isNextPageAvailable: isNextPageAvailable == freezed
          ? _value.isNextPageAvailable
          : isNextPageAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_LoadSuccess extends _LoadSuccess {
  const _$_LoadSuccess(this.repos, {required this.isNextPageAvailable})
      : super._();

  @override
  final Fresh<List<GithubRepo>> repos;
  @override
  final bool isNextPageAvailable;

  @override
  String toString() {
    return 'PaginatedReposState.loadSuccess(repos: $repos, isNextPageAvailable: $isNextPageAvailable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadSuccess &&
            (identical(other.repos, repos) ||
                const DeepCollectionEquality().equals(other.repos, repos)) &&
            (identical(other.isNextPageAvailable, isNextPageAvailable) ||
                const DeepCollectionEquality()
                    .equals(other.isNextPageAvailable, isNextPageAvailable)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(repos) ^
      const DeepCollectionEquality().hash(isNextPageAvailable);

  @JsonKey(ignore: true)
  @override
  _$LoadSuccessCopyWith<_LoadSuccess> get copyWith =>
      __$LoadSuccessCopyWithImpl<_LoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<GithubRepo>> repos) initial,
    required TResult Function(Fresh<List<GithubRepo>> repos, int itemsPerPage)
        loadInProgress,
    required TResult Function(
            Fresh<List<GithubRepo>> repos, bool isNextPageAvailable)
        loadSuccess,
    required TResult Function(
            Fresh<List<GithubRepo>> repos, GithubFailure failure)
        hasFailure,
  }) {
    return loadSuccess(repos, isNextPageAvailable);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Fresh<List<GithubRepo>> repos)? initial,
    TResult Function(Fresh<List<GithubRepo>> repos, int itemsPerPage)?
        loadInProgress,
    TResult Function(Fresh<List<GithubRepo>> repos, bool isNextPageAvailable)?
        loadSuccess,
    TResult Function(Fresh<List<GithubRepo>> repos, GithubFailure failure)?
        hasFailure,
  }) {
    return loadSuccess?.call(repos, isNextPageAvailable);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<GithubRepo>> repos)? initial,
    TResult Function(Fresh<List<GithubRepo>> repos, int itemsPerPage)?
        loadInProgress,
    TResult Function(Fresh<List<GithubRepo>> repos, bool isNextPageAvailable)?
        loadSuccess,
    TResult Function(Fresh<List<GithubRepo>> repos, GithubFailure failure)?
        hasFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(repos, isNextPageAvailable);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_HasFailure value) hasFailure,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_HasFailure value)? hasFailure,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_HasFailure value)? hasFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoadSuccess extends PaginatedReposState {
  const factory _LoadSuccess(Fresh<List<GithubRepo>> repos,
      {required bool isNextPageAvailable}) = _$_LoadSuccess;
  const _LoadSuccess._() : super._();

  @override
  Fresh<List<GithubRepo>> get repos => throw _privateConstructorUsedError;
  bool get isNextPageAvailable => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LoadSuccessCopyWith<_LoadSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$HasFailureCopyWith<$Res>
    implements $PaginatedReposStateCopyWith<$Res> {
  factory _$HasFailureCopyWith(
          _HasFailure value, $Res Function(_HasFailure) then) =
      __$HasFailureCopyWithImpl<$Res>;
  @override
  $Res call({Fresh<List<GithubRepo>> repos, GithubFailure failure});

  @override
  $FreshCopyWith<List<GithubRepo>, $Res> get repos;
  $GithubFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$HasFailureCopyWithImpl<$Res>
    extends _$PaginatedReposStateCopyWithImpl<$Res>
    implements _$HasFailureCopyWith<$Res> {
  __$HasFailureCopyWithImpl(
      _HasFailure _value, $Res Function(_HasFailure) _then)
      : super(_value, (v) => _then(v as _HasFailure));

  @override
  _HasFailure get _value => super._value as _HasFailure;

  @override
  $Res call({
    Object? repos = freezed,
    Object? failure = freezed,
  }) {
    return _then(_HasFailure(
      repos == freezed
          ? _value.repos
          : repos // ignore: cast_nullable_to_non_nullable
              as Fresh<List<GithubRepo>>,
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as GithubFailure,
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

class _$_HasFailure extends _HasFailure {
  const _$_HasFailure(this.repos, this.failure) : super._();

  @override
  final Fresh<List<GithubRepo>> repos;
  @override
  final GithubFailure failure;

  @override
  String toString() {
    return 'PaginatedReposState.hasFailure(repos: $repos, failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HasFailure &&
            (identical(other.repos, repos) ||
                const DeepCollectionEquality().equals(other.repos, repos)) &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(repos) ^
      const DeepCollectionEquality().hash(failure);

  @JsonKey(ignore: true)
  @override
  _$HasFailureCopyWith<_HasFailure> get copyWith =>
      __$HasFailureCopyWithImpl<_HasFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<GithubRepo>> repos) initial,
    required TResult Function(Fresh<List<GithubRepo>> repos, int itemsPerPage)
        loadInProgress,
    required TResult Function(
            Fresh<List<GithubRepo>> repos, bool isNextPageAvailable)
        loadSuccess,
    required TResult Function(
            Fresh<List<GithubRepo>> repos, GithubFailure failure)
        hasFailure,
  }) {
    return hasFailure(repos, failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Fresh<List<GithubRepo>> repos)? initial,
    TResult Function(Fresh<List<GithubRepo>> repos, int itemsPerPage)?
        loadInProgress,
    TResult Function(Fresh<List<GithubRepo>> repos, bool isNextPageAvailable)?
        loadSuccess,
    TResult Function(Fresh<List<GithubRepo>> repos, GithubFailure failure)?
        hasFailure,
  }) {
    return hasFailure?.call(repos, failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<GithubRepo>> repos)? initial,
    TResult Function(Fresh<List<GithubRepo>> repos, int itemsPerPage)?
        loadInProgress,
    TResult Function(Fresh<List<GithubRepo>> repos, bool isNextPageAvailable)?
        loadSuccess,
    TResult Function(Fresh<List<GithubRepo>> repos, GithubFailure failure)?
        hasFailure,
    required TResult orElse(),
  }) {
    if (hasFailure != null) {
      return hasFailure(repos, failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_HasFailure value) hasFailure,
  }) {
    return hasFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_HasFailure value)? hasFailure,
  }) {
    return hasFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_HasFailure value)? hasFailure,
    required TResult orElse(),
  }) {
    if (hasFailure != null) {
      return hasFailure(this);
    }
    return orElse();
  }
}

abstract class _HasFailure extends PaginatedReposState {
  const factory _HasFailure(
      Fresh<List<GithubRepo>> repos, GithubFailure failure) = _$_HasFailure;
  const _HasFailure._() : super._();

  @override
  Fresh<List<GithubRepo>> get repos => throw _privateConstructorUsedError;
  GithubFailure get failure => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$HasFailureCopyWith<_HasFailure> get copyWith =>
      throw _privateConstructorUsedError;
}