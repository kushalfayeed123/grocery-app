part of 'session_form_bloc.dart';

@freezed
class SessionFormEvent with _$SessionFormEvent {
  const factory SessionFormEvent.reset() = _Reset;
  const factory SessionFormEvent.initialized(Option<Session> initialOption) =
      _Initialized;

  const factory SessionFormEvent.totalBudgetedPriceChanged() =
      _TotalBudgetedPriceChanged;
  const factory SessionFormEvent.totalActualPriceChanged() =
      _TotalActualPriceChanged;
  const factory SessionFormEvent.statusChanged(String statusStr) =
      _StatusChanged;
  const factory SessionFormEvent.scheduledDateChanged(DateTime scheduledDate) =
      _ScheduledDateChanged;
  const factory SessionFormEvent.groceriesChanged(
      KtList<GroceryItemPrimitive> groceries) = _GroceriesChanged;
  const factory SessionFormEvent.grocerySaved(
      KtList<GroceryItemPrimitive> groceries) = _GrocerySaved;
  const factory SessionFormEvent.saved() = _Saved;
}
