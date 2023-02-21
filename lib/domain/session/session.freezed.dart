// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Session {
  UniqueId get id => throw _privateConstructorUsedError;
  SessionStatus get status => throw _privateConstructorUsedError;
  ValidatedNumber get totalBudgetedPrice => throw _privateConstructorUsedError;
  int get totalActualPrice => throw _privateConstructorUsedError;
  DateTime get createdDate => throw _privateConstructorUsedError;
  DateTime get scheduledDate => throw _privateConstructorUsedError;
  GList<GroceryItem> get groceries => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SessionCopyWith<Session> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionCopyWith<$Res> {
  factory $SessionCopyWith(Session value, $Res Function(Session) then) =
      _$SessionCopyWithImpl<$Res, Session>;
  @useResult
  $Res call(
      {UniqueId id,
      SessionStatus status,
      ValidatedNumber totalBudgetedPrice,
      int totalActualPrice,
      DateTime createdDate,
      DateTime scheduledDate,
      GList<GroceryItem> groceries});
}

/// @nodoc
class _$SessionCopyWithImpl<$Res, $Val extends Session>
    implements $SessionCopyWith<$Res> {
  _$SessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? totalBudgetedPrice = null,
    Object? totalActualPrice = null,
    Object? createdDate = null,
    Object? scheduledDate = null,
    Object? groceries = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SessionStatus,
      totalBudgetedPrice: null == totalBudgetedPrice
          ? _value.totalBudgetedPrice
          : totalBudgetedPrice // ignore: cast_nullable_to_non_nullable
              as ValidatedNumber,
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
              as GList<GroceryItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SessionCopyWith<$Res> implements $SessionCopyWith<$Res> {
  factory _$$_SessionCopyWith(
          _$_Session value, $Res Function(_$_Session) then) =
      __$$_SessionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UniqueId id,
      SessionStatus status,
      ValidatedNumber totalBudgetedPrice,
      int totalActualPrice,
      DateTime createdDate,
      DateTime scheduledDate,
      GList<GroceryItem> groceries});
}

/// @nodoc
class __$$_SessionCopyWithImpl<$Res>
    extends _$SessionCopyWithImpl<$Res, _$_Session>
    implements _$$_SessionCopyWith<$Res> {
  __$$_SessionCopyWithImpl(_$_Session _value, $Res Function(_$_Session) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? totalBudgetedPrice = null,
    Object? totalActualPrice = null,
    Object? createdDate = null,
    Object? scheduledDate = null,
    Object? groceries = null,
  }) {
    return _then(_$_Session(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SessionStatus,
      totalBudgetedPrice: null == totalBudgetedPrice
          ? _value.totalBudgetedPrice
          : totalBudgetedPrice // ignore: cast_nullable_to_non_nullable
              as ValidatedNumber,
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
              as GList<GroceryItem>,
    ));
  }
}

/// @nodoc

class _$_Session extends _Session {
  const _$_Session(
      {required this.id,
      required this.status,
      required this.totalBudgetedPrice,
      required this.totalActualPrice,
      required this.createdDate,
      required this.scheduledDate,
      required this.groceries})
      : super._();

  @override
  final UniqueId id;
  @override
  final SessionStatus status;
  @override
  final ValidatedNumber totalBudgetedPrice;
  @override
  final int totalActualPrice;
  @override
  final DateTime createdDate;
  @override
  final DateTime scheduledDate;
  @override
  final GList<GroceryItem> groceries;

  @override
  String toString() {
    return 'Session(id: $id, status: $status, totalBudgetedPrice: $totalBudgetedPrice, totalActualPrice: $totalActualPrice, createdDate: $createdDate, scheduledDate: $scheduledDate, groceries: $groceries)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Session &&
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
            (identical(other.groceries, groceries) ||
                other.groceries == groceries));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, status, totalBudgetedPrice,
      totalActualPrice, createdDate, scheduledDate, groceries);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SessionCopyWith<_$_Session> get copyWith =>
      __$$_SessionCopyWithImpl<_$_Session>(this, _$identity);
}

abstract class _Session extends Session {
  const factory _Session(
      {required final UniqueId id,
      required final SessionStatus status,
      required final ValidatedNumber totalBudgetedPrice,
      required final int totalActualPrice,
      required final DateTime createdDate,
      required final DateTime scheduledDate,
      required final GList<GroceryItem> groceries}) = _$_Session;
  const _Session._() : super._();

  @override
  UniqueId get id;
  @override
  SessionStatus get status;
  @override
  ValidatedNumber get totalBudgetedPrice;
  @override
  int get totalActualPrice;
  @override
  DateTime get createdDate;
  @override
  DateTime get scheduledDate;
  @override
  GList<GroceryItem> get groceries;
  @override
  @JsonKey(ignore: true)
  _$$_SessionCopyWith<_$_Session> get copyWith =>
      throw _privateConstructorUsedError;
}
