import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grocery_app/domain/core/value_object.dart';
import 'package:grocery_app/domain/session/grocery_item.dart';
import 'package:grocery_app/domain/session/session.dart';
import 'package:grocery_app/domain/session/value_objects.dart';
import 'package:kt_dart/kt.dart';

part 'session_dtos.freezed.dart';
part 'session_dtos.g.dart';

@freezed
abstract class SessionDto implements _$SessionDto {
  const SessionDto._();
  const factory SessionDto({
    @JsonKey(ignore: true) String? id,
    required String status,
    required int totalBudgetedPrice,
    required int totalActualPrice,
    required DateTime createdDate,
    required DateTime scheduledDate,
    required List<GroceryItemDto> groceries,
  }) = _SessionDto;

  factory SessionDto.fromDomain(Session session) {
    return SessionDto(
      id: session.id.getOrCrash(),
      status: session.status.getOrCrash(),
      totalBudgetedPrice: session.totalBudgetedPrice.getOrCrash(),
      totalActualPrice: session.totalActualPrice,
      createdDate: session.createdDate,
      scheduledDate: session.scheduledDate,
      groceries: session.groceries
          .getOrCrash()
          .map((groceryItem) => GroceryItemDto.fromDomain(groceryItem))
          .asList(),
    );
  }

  Session toDomain() {
    return Session(
        id: UniqueId.fromUniqueString(id ?? ''),
        status: SessionStatus(status),
        totalBudgetedPrice: ValidatedNumber(totalBudgetedPrice),
        totalActualPrice: totalActualPrice,
        createdDate: createdDate,
        scheduledDate: scheduledDate,
        groceries:
            GList(groceries.map((dto) => dto.toDomain()).toImmutableList()));
  }

  factory SessionDto.fromJson(Map<String, dynamic> json) =>
      _$SessionDtoFromJson(json);

  factory SessionDto.fromFirestore(DocumentSnapshot doc) {
    return SessionDto.fromJson(doc.data() as Map<String, dynamic>)
        .copyWith(id: doc.id);
  }
}

@freezed
abstract class GroceryItemDto implements _$GroceryItemDto {
  const GroceryItemDto._();
  const factory GroceryItemDto({
    required String id,
    required String name,
    required String description,
    required String image,
    required String category,
    required int budgetedPrice,
    required int actualPrice,
    required int quantity,
    required bool isInCart,
    required bool show,
    // required DateTime addedDate,
  }) = _GroceryITemDto;

  factory GroceryItemDto.fromDomain(GroceryItem groceryItem) {
    return GroceryItemDto(
      id: groceryItem.id.getOrCrash(),
      name: groceryItem.name.getOrCrash(),
      description: groceryItem.description.getOrCrash(),
      image: groceryItem.image,
      budgetedPrice: groceryItem.budgetedPrice.getOrCrash(),
      actualPrice: groceryItem.actualPrice,
      quantity: groceryItem.quantity.getOrCrash(),
      isInCart: groceryItem.isInCart,
      show: groceryItem.show,
      // addedDate: groceryItem.addedDate,
      category: groceryItem.category.getOrCrash(),
    );
  }

  GroceryItem toDomain() {
    return GroceryItem(
        id: UniqueId.fromUniqueString(id),
        name: GroceryName(name),
        description: GroceryDescription(description),
        category: GroceryCategory(category),
        quantity: ValidatedNumber(quantity),
        budgetedPrice: ValidatedNumber(budgetedPrice),
        actualPrice: actualPrice,
        image: image,
        // addedDate: addedDate,
        isInCart: isInCart,
        show: show);
  }

  factory GroceryItemDto.fromJson(Map<String, dynamic> json) =>
      _$GroceryItemDtoFromJson(json);
}

class ServerTimeStampConverter implements JsonConverter<FieldValue, Object> {
  const ServerTimeStampConverter();
  @override
  FieldValue fromJson(Object json) {
    return FieldValue.serverTimestamp();
  }

  @override
  Object toJson(FieldValue fieldValue) => fieldValue;
}
