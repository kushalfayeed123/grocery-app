import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_user_failure.freezed.dart';

@freezed
abstract class AppUserFailure with _$AppUserFailure {
  const factory AppUserFailure.unexpected() = _Unexpected;
  const factory AppUserFailure.insufficientPermission() =
      _InsufficientPermission;
  const factory AppUserFailure.unableToUpdate() = _UnableToUpdate;
}
