import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class ValueFailure<T> with _$ValueFailure<T> {
  factory ValueFailure.exceedingLength({
    required T? failedValue,
    required int max,
  }) = ExceedingLength<T>;
  factory ValueFailure.empty({
    required T? failedValue,
  }) = Empty<T>;
  factory ValueFailure.invalidEmail({
    required T? failedValue,
  }) = InValidEmail<T>;
  factory ValueFailure.multiline({
    required T? failedValue,
  }) = MultiLine<T>;
  factory ValueFailure.shortPassword({
    required T? failedValue,
  }) = ShortPassword<T>;
  factory ValueFailure.zeroNumber({
    required T? failedValue,
  }) = ZeroNumber<T>;
}
