// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_user_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppUserDto _$AppUserDtoFromJson(Map<String, dynamic> json) {
  return _AppUserDto.fromJson(json);
}

/// @nodoc
mixin _$AppUserDto {
  @JsonKey(ignore: true)
  String? get id => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @ServerTimeStampConverter()
  FieldValue get createdDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppUserDtoCopyWith<AppUserDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserDtoCopyWith<$Res> {
  factory $AppUserDtoCopyWith(
          AppUserDto value, $Res Function(AppUserDto) then) =
      _$AppUserDtoCopyWithImpl<$Res, AppUserDto>;
  @useResult
  $Res call(
      {@JsonKey(ignore: true) String? id,
      String firstName,
      String lastName,
      String email,
      @ServerTimeStampConverter() FieldValue createdDate});
}

/// @nodoc
class _$AppUserDtoCopyWithImpl<$Res, $Val extends AppUserDto>
    implements $AppUserDtoCopyWith<$Res> {
  _$AppUserDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? createdDate = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as FieldValue,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppUserDtoCopyWith<$Res>
    implements $AppUserDtoCopyWith<$Res> {
  factory _$$_AppUserDtoCopyWith(
          _$_AppUserDto value, $Res Function(_$_AppUserDto) then) =
      __$$_AppUserDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(ignore: true) String? id,
      String firstName,
      String lastName,
      String email,
      @ServerTimeStampConverter() FieldValue createdDate});
}

/// @nodoc
class __$$_AppUserDtoCopyWithImpl<$Res>
    extends _$AppUserDtoCopyWithImpl<$Res, _$_AppUserDto>
    implements _$$_AppUserDtoCopyWith<$Res> {
  __$$_AppUserDtoCopyWithImpl(
      _$_AppUserDto _value, $Res Function(_$_AppUserDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? createdDate = null,
  }) {
    return _then(_$_AppUserDto(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as FieldValue,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppUserDto extends _AppUserDto {
  const _$_AppUserDto(
      {@JsonKey(ignore: true) this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      @ServerTimeStampConverter() required this.createdDate})
      : super._();

  factory _$_AppUserDto.fromJson(Map<String, dynamic> json) =>
      _$$_AppUserDtoFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String? id;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String email;
  @override
  @ServerTimeStampConverter()
  final FieldValue createdDate;

  @override
  String toString() {
    return 'AppUserDto(id: $id, firstName: $firstName, lastName: $lastName, email: $email, createdDate: $createdDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppUserDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, firstName, lastName, email, createdDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppUserDtoCopyWith<_$_AppUserDto> get copyWith =>
      __$$_AppUserDtoCopyWithImpl<_$_AppUserDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppUserDtoToJson(
      this,
    );
  }
}

abstract class _AppUserDto extends AppUserDto {
  const factory _AppUserDto(
          {@JsonKey(ignore: true) final String? id,
          required final String firstName,
          required final String lastName,
          required final String email,
          @ServerTimeStampConverter() required final FieldValue createdDate}) =
      _$_AppUserDto;
  const _AppUserDto._() : super._();

  factory _AppUserDto.fromJson(Map<String, dynamic> json) =
      _$_AppUserDto.fromJson;

  @override
  @JsonKey(ignore: true)
  String? get id;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get email;
  @override
  @ServerTimeStampConverter()
  FieldValue get createdDate;
  @override
  @JsonKey(ignore: true)
  _$$_AppUserDtoCopyWith<_$_AppUserDto> get copyWith =>
      throw _privateConstructorUsedError;
}
