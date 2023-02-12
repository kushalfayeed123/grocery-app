// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SessionDto _$SessionDtoFromJson(Map<String, dynamic> json) {
  return _SessionDto.fromJson(json);
}

/// @nodoc
mixin _$SessionDto {
  @JsonKey(ignore: true)
  String? get id => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get totalBudgetedPrice => throw _privateConstructorUsedError;
  int get totalActualPrice => throw _privateConstructorUsedError;
  DateTime get createdDate => throw _privateConstructorUsedError;
  DateTime get scheduledDate => throw _privateConstructorUsedError;
  List<GroceryItemDto> get groceries => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SessionDtoCopyWith<SessionDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionDtoCopyWith<$Res> {
  factory $SessionDtoCopyWith(
          SessionDto value, $Res Function(SessionDto) then) =
      _$SessionDtoCopyWithImpl<$Res, SessionDto>;
  @useResult
  $Res call(
      {@JsonKey(ignore: true) String? id,
      String status,
      int totalBudgetedPrice,
      int totalActualPrice,
      DateTime createdDate,
      DateTime scheduledDate,
      List<GroceryItemDto> groceries});
}

/// @nodoc
class _$SessionDtoCopyWithImpl<$Res, $Val extends SessionDto>
    implements $SessionDtoCopyWith<$Res> {
  _$SessionDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? status = null,
    Object? totalBudgetedPrice = null,
    Object? totalActualPrice = null,
    Object? createdDate = null,
    Object? scheduledDate = null,
    Object? groceries = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      totalBudgetedPrice: null == totalBudgetedPrice
          ? _value.totalBudgetedPrice
          : totalBudgetedPrice // ignore: cast_nullable_to_non_nullable
              as int,
      totalActualPrice: null == totalActualPrice
          ? _value.totalActualPrice
          : totalActualPrice // ignore: cast_nullable_to_non_nullable
              as int,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      scheduledDate: null == scheduledDate
          ? _value.scheduledDate
          : scheduledDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      groceries: null == groceries
          ? _value.groceries
          : groceries // ignore: cast_nullable_to_non_nullable
              as List<GroceryItemDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SessionDtoCopyWith<$Res>
    implements $SessionDtoCopyWith<$Res> {
  factory _$$_SessionDtoCopyWith(
          _$_SessionDto value, $Res Function(_$_SessionDto) then) =
      __$$_SessionDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(ignore: true) String? id,
      String status,
      int totalBudgetedPrice,
      int totalActualPrice,
      DateTime createdDate,
      DateTime scheduledDate,
      List<GroceryItemDto> groceries});
}

/// @nodoc
class __$$_SessionDtoCopyWithImpl<$Res>
    extends _$SessionDtoCopyWithImpl<$Res, _$_SessionDto>
    implements _$$_SessionDtoCopyWith<$Res> {
  __$$_SessionDtoCopyWithImpl(
      _$_SessionDto _value, $Res Function(_$_SessionDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? status = null,
    Object? totalBudgetedPrice = null,
    Object? totalActualPrice = null,
    Object? createdDate = null,
    Object? scheduledDate = null,
    Object? groceries = null,
  }) {
    return _then(_$_SessionDto(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      totalBudgetedPrice: null == totalBudgetedPrice
          ? _value.totalBudgetedPrice
          : totalBudgetedPrice // ignore: cast_nullable_to_non_nullable
              as int,
      totalActualPrice: null == totalActualPrice
          ? _value.totalActualPrice
          : totalActualPrice // ignore: cast_nullable_to_non_nullable
              as int,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      scheduledDate: null == scheduledDate
          ? _value.scheduledDate
          : scheduledDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      groceries: null == groceries
          ? _value._groceries
          : groceries // ignore: cast_nullable_to_non_nullable
              as List<GroceryItemDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SessionDto extends _SessionDto {
  const _$_SessionDto(
      {@JsonKey(ignore: true) this.id,
      required this.status,
      required this.totalBudgetedPrice,
      required this.totalActualPrice,
      required this.createdDate,
      required this.scheduledDate,
      required final List<GroceryItemDto> groceries})
      : _groceries = groceries,
        super._();

  factory _$_SessionDto.fromJson(Map<String, dynamic> json) =>
      _$$_SessionDtoFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String? id;
  @override
  final String status;
  @override
  final int totalBudgetedPrice;
  @override
  final int totalActualPrice;
  @override
  final DateTime createdDate;
  @override
  final DateTime scheduledDate;
  final List<GroceryItemDto> _groceries;
  @override
  List<GroceryItemDto> get groceries {
    if (_groceries is EqualUnmodifiableListView) return _groceries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groceries);
  }

  @override
  String toString() {
    return 'SessionDto(id: $id, status: $status, totalBudgetedPrice: $totalBudgetedPrice, totalActualPrice: $totalActualPrice, createdDate: $createdDate, scheduledDate: $scheduledDate, groceries: $groceries)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SessionDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.totalBudgetedPrice, totalBudgetedPrice) ||
                other.totalBudgetedPrice == totalBudgetedPrice) &&
            (identical(other.totalActualPrice, totalActualPrice) ||
                other.totalActualPrice == totalActualPrice) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.scheduledDate, scheduledDate) ||
                other.scheduledDate == scheduledDate) &&
            const DeepCollectionEquality()
                .equals(other._groceries, _groceries));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      status,
      totalBudgetedPrice,
      totalActualPrice,
      createdDate,
      scheduledDate,
      const DeepCollectionEquality().hash(_groceries));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SessionDtoCopyWith<_$_SessionDto> get copyWith =>
      __$$_SessionDtoCopyWithImpl<_$_SessionDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SessionDtoToJson(
      this,
    );
  }
}

abstract class _SessionDto extends SessionDto {
  const factory _SessionDto(
      {@JsonKey(ignore: true) final String? id,
      required final String status,
      required final int totalBudgetedPrice,
      required final int totalActualPrice,
      required final DateTime createdDate,
      required final DateTime scheduledDate,
      required final List<GroceryItemDto> groceries}) = _$_SessionDto;
  const _SessionDto._() : super._();

  factory _SessionDto.fromJson(Map<String, dynamic> json) =
      _$_SessionDto.fromJson;

  @override
  @JsonKey(ignore: true)
  String? get id;
  @override
  String get status;
  @override
  int get totalBudgetedPrice;
  @override
  int get totalActualPrice;
  @override
  DateTime get createdDate;
  @override
  DateTime get scheduledDate;
  @override
  List<GroceryItemDto> get groceries;
  @override
  @JsonKey(ignore: true)
  _$$_SessionDtoCopyWith<_$_SessionDto> get copyWith =>
      throw _privateConstructorUsedError;
}

GroceryItemDto _$GroceryItemDtoFromJson(Map<String, dynamic> json) {
  return _GroceryITemDto.fromJson(json);
}

/// @nodoc
mixin _$GroceryItemDto {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  int get budgetedPrice => throw _privateConstructorUsedError;
  int get actualPrice => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  bool get isInCart => throw _privateConstructorUsedError;
  DateTime get addedDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GroceryItemDtoCopyWith<GroceryItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroceryItemDtoCopyWith<$Res> {
  factory $GroceryItemDtoCopyWith(
          GroceryItemDto value, $Res Function(GroceryItemDto) then) =
      _$GroceryItemDtoCopyWithImpl<$Res, GroceryItemDto>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String image,
      String category,
      int budgetedPrice,
      int actualPrice,
      int quantity,
      bool isInCart,
      DateTime addedDate});
}

/// @nodoc
class _$GroceryItemDtoCopyWithImpl<$Res, $Val extends GroceryItemDto>
    implements $GroceryItemDtoCopyWith<$Res> {
  _$GroceryItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? image = null,
    Object? category = null,
    Object? budgetedPrice = null,
    Object? actualPrice = null,
    Object? quantity = null,
    Object? isInCart = null,
    Object? addedDate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      budgetedPrice: null == budgetedPrice
          ? _value.budgetedPrice
          : budgetedPrice // ignore: cast_nullable_to_non_nullable
              as int,
      actualPrice: null == actualPrice
          ? _value.actualPrice
          : actualPrice // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      isInCart: null == isInCart
          ? _value.isInCart
          : isInCart // ignore: cast_nullable_to_non_nullable
              as bool,
      addedDate: null == addedDate
          ? _value.addedDate
          : addedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GroceryITemDtoCopyWith<$Res>
    implements $GroceryItemDtoCopyWith<$Res> {
  factory _$$_GroceryITemDtoCopyWith(
          _$_GroceryITemDto value, $Res Function(_$_GroceryITemDto) then) =
      __$$_GroceryITemDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String image,
      String category,
      int budgetedPrice,
      int actualPrice,
      int quantity,
      bool isInCart,
      DateTime addedDate});
}

/// @nodoc
class __$$_GroceryITemDtoCopyWithImpl<$Res>
    extends _$GroceryItemDtoCopyWithImpl<$Res, _$_GroceryITemDto>
    implements _$$_GroceryITemDtoCopyWith<$Res> {
  __$$_GroceryITemDtoCopyWithImpl(
      _$_GroceryITemDto _value, $Res Function(_$_GroceryITemDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? image = null,
    Object? category = null,
    Object? budgetedPrice = null,
    Object? actualPrice = null,
    Object? quantity = null,
    Object? isInCart = null,
    Object? addedDate = null,
  }) {
    return _then(_$_GroceryITemDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      budgetedPrice: null == budgetedPrice
          ? _value.budgetedPrice
          : budgetedPrice // ignore: cast_nullable_to_non_nullable
              as int,
      actualPrice: null == actualPrice
          ? _value.actualPrice
          : actualPrice // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      isInCart: null == isInCart
          ? _value.isInCart
          : isInCart // ignore: cast_nullable_to_non_nullable
              as bool,
      addedDate: null == addedDate
          ? _value.addedDate
          : addedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GroceryITemDto extends _GroceryITemDto {
  const _$_GroceryITemDto(
      {required this.id,
      required this.name,
      required this.description,
      required this.image,
      required this.category,
      required this.budgetedPrice,
      required this.actualPrice,
      required this.quantity,
      required this.isInCart,
      required this.addedDate})
      : super._();

  factory _$_GroceryITemDto.fromJson(Map<String, dynamic> json) =>
      _$$_GroceryITemDtoFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String image;
  @override
  final String category;
  @override
  final int budgetedPrice;
  @override
  final int actualPrice;
  @override
  final int quantity;
  @override
  final bool isInCart;
  @override
  final DateTime addedDate;

  @override
  String toString() {
    return 'GroceryItemDto(id: $id, name: $name, description: $description, image: $image, category: $category, budgetedPrice: $budgetedPrice, actualPrice: $actualPrice, quantity: $quantity, isInCart: $isInCart, addedDate: $addedDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GroceryITemDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.budgetedPrice, budgetedPrice) ||
                other.budgetedPrice == budgetedPrice) &&
            (identical(other.actualPrice, actualPrice) ||
                other.actualPrice == actualPrice) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.isInCart, isInCart) ||
                other.isInCart == isInCart) &&
            (identical(other.addedDate, addedDate) ||
                other.addedDate == addedDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, image,
      category, budgetedPrice, actualPrice, quantity, isInCart, addedDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GroceryITemDtoCopyWith<_$_GroceryITemDto> get copyWith =>
      __$$_GroceryITemDtoCopyWithImpl<_$_GroceryITemDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GroceryITemDtoToJson(
      this,
    );
  }
}

abstract class _GroceryITemDto extends GroceryItemDto {
  const factory _GroceryITemDto(
      {required final String id,
      required final String name,
      required final String description,
      required final String image,
      required final String category,
      required final int budgetedPrice,
      required final int actualPrice,
      required final int quantity,
      required final bool isInCart,
      required final DateTime addedDate}) = _$_GroceryITemDto;
  const _GroceryITemDto._() : super._();

  factory _GroceryITemDto.fromJson(Map<String, dynamic> json) =
      _$_GroceryITemDto.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get image;
  @override
  String get category;
  @override
  int get budgetedPrice;
  @override
  int get actualPrice;
  @override
  int get quantity;
  @override
  bool get isInCart;
  @override
  DateTime get addedDate;
  @override
  @JsonKey(ignore: true)
  _$$_GroceryITemDtoCopyWith<_$_GroceryITemDto> get copyWith =>
      throw _privateConstructorUsedError;
}
