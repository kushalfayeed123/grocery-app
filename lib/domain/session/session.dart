import 'package:freezed_annotation/freezed_annotation.dart';
import '../core/value_object.dart';
import 'grocery_item.dart';
import 'value_objects.dart';
import 'package:kt_dart/collection.dart';

import '../sessions/status_enum.dart';
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
    required GList<GroceryItem> groceryList,
  }) = _Session;

  factory Session.empty() => Session(
      id: UniqueId(),
      status: SessionStatus(Status.notStarted),
      totalBudgetedPrice: ValidatedNumber(0),
      totalActualPrice: ValidatedNumber(0),
      createdDate: DateTime.now(),
      scheduledDate: DateTime.now(),
      groceryList: GList(emptyList()));
}
