import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grocery_app/domain/session/status.dart';
import '../core/failures.dart';
import '../core/value_object.dart';
import 'grocery_item.dart';
import 'value_objects.dart';
import 'package:kt_dart/collection.dart';

part 'session.freezed.dart';

@freezed
abstract class Session implements _$Session {
  const Session._();
  const factory Session({
    required UniqueId id,
    required SessionStatus status,
    required ValidatedNumber totalBudgetedPrice,
    required ValidatedNumber totalActualPrice,
    required DateTime createdDate,
    required DateTime scheduledDate,
    required GList<GroceryItem> groceries,
  }) = _Session;

  factory Session.empty() => Session(
      id: UniqueId(),
      status: SessionStatus(Status.notStarted),
      totalBudgetedPrice: ValidatedNumber(1),
      totalActualPrice: ValidatedNumber(1),
      createdDate: DateTime.now(),
      scheduledDate: DateTime.now(),
      groceries: GList(emptyList()));

  Option<ValueFailure<dynamic>> get failureOption {
    return status.failureOrUnit
        .andThen(groceries.failureOrUnit)
        .andThen(
          groceries
              .getOrCrash()
              .map((groceryItem) => groceryItem.failureOption)
              .filter((o) => o.isSome())
              .getOrElse(0, (_) => none())
              .fold(() => right(unit), (a) => left(a)),
        )
        .fold((f) => some(f), (_) => none());
  }
}
