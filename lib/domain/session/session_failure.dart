import 'package:freezed_annotation/freezed_annotation.dart';
part 'session_failure.freezed.dart';

@freezed
abstract class SessionFailure with _$SessionFailure {
  const factory SessionFailure.unexpected() = _Unexpected;
  const factory SessionFailure.insufficientPermission() =
      _InsufficientPermission;
  const factory SessionFailure.unableToUpdate() = _UnableToUpdate;
}
