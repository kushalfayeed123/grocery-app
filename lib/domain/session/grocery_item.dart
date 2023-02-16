import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../core/failures.dart';
import '../core/value_object.dart';
import 'value_objects.dart';
part 'grocery_item.freezed.dart';

@freezed
abstract class GroceryItem implements _$GroceryItem {
  const GroceryItem._();
  const factory GroceryItem({
    required UniqueId id,
    required GroceryName name,
    required GroceryDescription description,
    required GroceryCategory category,
    required ValidatedNumber quantity,
    required ValidatedNumber budgetedPrice,
    required ValidatedNumber actualPrice,
    required String image,
    required DateTime addedDate,
    required bool isInCart,
    required bool show,
  }) = _GroceryItem;

  factory GroceryItem.empty() => GroceryItem(
      id: UniqueId(),
      name: GroceryName(''),
      quantity: ValidatedNumber(0),
      budgetedPrice: ValidatedNumber(0),
      actualPrice: ValidatedNumber(0),
      image: '',
      addedDate: DateTime.now(),
      isInCart: false,
      description: GroceryDescription(''),
      category: GroceryCategory(''),
      show: false);

  Option<ValueFailure<dynamic>> get failureOption {
    return name.value.fold(
        (f) => some(f),
        (_) => none()
            .andThen(
              description.value.fold((f) => some(f), (_) => none()),
            )
            .andThen(category.value.fold(
                (f) => some(f),
                (_) => none().andThen(
                      quantity.value.fold(
                          (f) => some(f),
                          (_) => none().andThen(
                                budgetedPrice.value.fold(
                                  (f) => some(f),
                                  (_) => none(),
                                ),
                              )),
                    ))));
  }
}
