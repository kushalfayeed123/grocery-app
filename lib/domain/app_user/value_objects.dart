import 'package:dartz/dartz.dart';

import '../core/failures.dart';
import '../core/value_object.dart';
import '../core/value_validators.dart';

class UserEmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  factory UserEmailAddress(String input) {
    return UserEmailAddress._(validateEmailAddress(input));
  }
  const UserEmailAddress._(this.value);
}

class UserPassword extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  factory UserPassword(String input) {
    return UserPassword._(validatePassword(input));
  }
  const UserPassword._(this.value);
}

class FirstName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  factory FirstName(String input) {
    return FirstName._(validateStringNotEmpty(input));
  }
  const FirstName._(this.value);
}

class LastName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  factory LastName(String input) {
    return LastName._(validateStringNotEmpty(input));
  }
  const LastName._(this.value);
}
