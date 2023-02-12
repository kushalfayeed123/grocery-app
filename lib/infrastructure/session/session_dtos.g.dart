// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SessionDto _$$_SessionDtoFromJson(Map<String, dynamic> json) =>
    _$_SessionDto(
      status: json['status'] as String,
      totalBudgetedPrice: json['totalBudgetedPrice'] as int,
      totalActualPrice: json['totalActualPrice'] as int,
      createdDate: DateTime.parse(json['createdDate'] as String),
      scheduledDate: DateTime.parse(json['scheduledDate'] as String),
      groceries: (json['groceries'] as List<dynamic>)
          .map((e) => GroceryItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SessionDtoToJson(_$_SessionDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalBudgetedPrice': instance.totalBudgetedPrice,
      'totalActualPrice': instance.totalActualPrice,
      'createdDate': instance.createdDate.toIso8601String(),
      'scheduledDate': instance.scheduledDate.toIso8601String(),
      'groceries': instance.groceries,
    };

_$_GroceryITemDto _$$_GroceryITemDtoFromJson(Map<String, dynamic> json) =>
    _$_GroceryITemDto(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      category: json['category'] as String,
      budgetedPrice: json['budgetedPrice'] as int,
      actualPrice: json['actualPrice'] as int,
      quantity: json['quantity'] as int,
      isInCart: json['isInCart'] as bool,
      addedDate: DateTime.parse(json['addedDate'] as String),
    );

Map<String, dynamic> _$$_GroceryITemDtoToJson(_$_GroceryITemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'category': instance.category,
      'budgetedPrice': instance.budgetedPrice,
      'actualPrice': instance.actualPrice,
      'quantity': instance.quantity,
      'isInCart': instance.isInCart,
      'addedDate': instance.addedDate.toIso8601String(),
    };
