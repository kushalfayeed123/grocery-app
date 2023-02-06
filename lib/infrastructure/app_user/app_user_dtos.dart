import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grocery_app/domain/app_user/app_user.dart';
import 'package:grocery_app/domain/app_user/value_objects.dart';
import 'package:grocery_app/domain/core/value_object.dart';

import '../../domain/auth/value_objects.dart';
part 'app_user_dtos.freezed.dart';
part 'app_user_dtos.g.dart';

@freezed
abstract class AppUserDto implements _$AppUserDto {
  const AppUserDto._();
  const factory AppUserDto({
    @JsonKey(ignore: true) String? id,
    required String firstName,
    required String lastName,
    required String email,
    @ServerTimeStampConverter() required FieldValue createdDate,
  }) = _AppUserDto;

  factory AppUserDto.fromDomain(
    AppUser appUser,
  ) {
    return AppUserDto(
        id: appUser.id.getOrCrash(),
        firstName: appUser.firstName.getOrCrash(),
        lastName: appUser.lastName.getOrCrash(),
        email: appUser.emailAddress.getOrCrash(),
        createdDate: FieldValue.serverTimestamp());
  }

  AppUser toDomain() {
    return AppUser(
      id: UniqueId.fromUniqueString(id ?? ''),
      firstName: FirstName(firstName),
      lastName: LastName(lastName),
      emailAddress: EmailAddress(email),
    );
  }

  factory AppUserDto.fromJson(Map<String, dynamic> json) =>
      _$AppUserDtoFromJson(json);

  factory AppUserDto.fromFirestore(DocumentSnapshot doc) {
    return AppUserDto.fromJson(doc.data() as Map<String, dynamic>)
        .copyWith(id: doc.id);
  }
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
