import 'package:freezed_annotation/freezed_annotation.dart';
part 'fresh.freezed.dart';

@freezed
class Fresh<T> with _$Fresh<T> {
  const Fresh._();

  const factory Fresh({
    required T entity,
    required bool isFresh,
    @Default(false) bool isNextPageAvailable,
  }) = _Fresh<T>;
}