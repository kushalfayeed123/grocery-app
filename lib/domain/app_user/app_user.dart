import 'package:freezed_annotation/freezed_annotation.dart';

import '../auth/value_objects.dart';
import '../core/value_object.dart';
import 'value_objects.dart';

part 'app_user.freezed.dart';

@freezed
abstract class AppUser implements _$AppUser {
  const AppUser._();
  const factory AppUser({
    required UniqueId id,
    required FirstName firstName,
    required LastName lastName,
    required EmailAddress emailAddress,
  }) = _AppUser;

  factory AppUser.empty() => AppUser(
        id: UniqueId(),
        firstName: FirstName(''),
        lastName: LastName(''),
        emailAddress: EmailAddress(''),
      );
}
