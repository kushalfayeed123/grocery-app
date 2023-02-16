import '../core/failures.dart';
import 'package:dartz/dartz.dart';
import '../core/value_object.dart';
import '../core/value_validators.dart';
import 'package:kt_dart/collection.dart';

class SessionStatus extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  factory SessionStatus(String input) {
    return SessionStatus._(
      validateStringNotEmpty(input).flatMap(validateSingleLine),
    );
  }
  const SessionStatus._(this.value);
}

class GroceryCategory extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  static const maxLength = 30;

  factory GroceryCategory(String input) {
    return GroceryCategory._(
      validateMaxStringLength(input, maxLength).flatMap(validateStringNotEmpty),
    );
  }
  const GroceryCategory._(this.value);
}

class ValidatedNumber extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;
  factory ValidatedNumber(int input) {
    return ValidatedNumber._(validateNumber(input));
  }
  const ValidatedNumber._(this.value);
}

class GroceryName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  static const maxLength = 30;

  factory GroceryName(String input) {
    return GroceryName._(validateMaxStringLength(input, maxLength)
        .flatMap(validateStringNotEmpty)
        .flatMap(validateSingleLine));
  }
  const GroceryName._(this.value);
}

class GroceryDescription extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  static const maxLength = 1000;
  factory GroceryDescription(String input) {
    return GroceryDescription._(validateMaxStringLength(input, maxLength)
        .flatMap(validateStringNotEmpty));
  }
  const GroceryDescription._(this.value);
}

class GList<T> extends ValueObject<KtList<T>> {
  @override
  final Either<ValueFailure<KtList<T>>, KtList<T>> value;
  factory GList(KtList<T> input) {
    return GList._(right(input));
  }
  const GList._(this.value);
  int get length {
    return value.getOrElse(() => emptyList()).size;
  }
}
