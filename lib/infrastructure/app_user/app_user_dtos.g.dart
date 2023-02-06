// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppUserDto _$$_AppUserDtoFromJson(Map<String, dynamic> json) =>
    _$_AppUserDto(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      createdDate: const ServerTimeStampConverter()
          .fromJson(json['createdDate'] as Object),
    );

Map<String, dynamic> _$$_AppUserDtoToJson(_$_AppUserDto instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'createdDate':
          const ServerTimeStampConverter().toJson(instance.createdDate),
    };
