import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grocery_app/domain/session/value_objects.dart';
import 'package:kt_dart/kt.dart';

import '../../../../domain/core/value_object.dart';
import '../../../../domain/session/grocery_item.dart';
part 'grocery_item_presentation_classes.freezed.dart';

class FormGroceries extends ValueNotifier<KtList<GroceryItemPrimitive>> {
  FormGroceries() : super(emptyList<GroceryItemPrimitive>());
}

@freezed
abstract class GroceryItemPrimitive implements _$GroceryItemPrimitive {
  const GroceryItemPrimitive._();

  const factory GroceryItemPrimitive({
    required UniqueId id,
    required String name,
    required String description,
    required String image,
    required String category,
    required int quantity,
    required int budgetedPrice,
    required bool isInCart,
    required bool show,
    // required DateTime addedDate,
    required int actualPrice,
  }) = _GroceryItemPrimitive;

  factory GroceryItemPrimitive.empty() => GroceryItemPrimitive(
        id: UniqueId(),
        name: '',
        description: '',
        image: '',
        quantity: 0,
        budgetedPrice: 0,
        actualPrice: 0,
        isInCart: false,
        show: false,
        // addedDate: DateTime.now(),
        category: '',
      );

  factory GroceryItemPrimitive.fromDomain(GroceryItem groceryItem) =>
      GroceryItemPrimitive(
        id: groceryItem.id,
        name: groceryItem.name.getOrCrash(),
        description: groceryItem.description.getOrCrash(),
        category: groceryItem.category.getOrCrash(),
        quantity: groceryItem.quantity.getOrCrash(),
        budgetedPrice: groceryItem.budgetedPrice.getOrCrash(),
        actualPrice: groceryItem.actualPrice,
        image: groceryItem.image,
        // addedDate: groceryItem.addedDate,
        isInCart: groceryItem.isInCart,
        show: groceryItem.show,
      );

  GroceryItem toDomain() {
    return GroceryItem(
      id: id,
      name: GroceryName(name),
      description: GroceryDescription(description),
      category: GroceryCategory(category),
      quantity: ValidatedNumber(quantity),
      budgetedPrice: ValidatedNumber(budgetedPrice),
      actualPrice: actualPrice,
      image: image,
      // addedDate: addedDate,
      isInCart: isInCart,
      show: show,
    );
  }
}
