import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:grocery_app/domain/app_user/app_user_failure.dart';

import 'package:grocery_app/domain/app_user/app_user.dart';

import 'package:dartz/dartz.dart';
import 'package:grocery_app/infrastructure/app_user/app_user_dtos.dart';
import 'package:injectable/injectable.dart';

import '../../domain/app_user/i_app_user_repository.dart';
import 'package:grocery_app/infrastructure/core/firestore_helpers.dart';

@LazySingleton(as: IAppUserRepository)
class AppUserRepository implements IAppUserRepository {
  final FirebaseFirestore _firestore;

  AppUserRepository(this._firestore);

  @override
  Future<Either<AppUserFailure, AppUser>> watchUser() async {
    final userDoc = await _firestore.userDocument();
    return userDoc
        .get()
        .then(
          (value) => right<AppUserFailure, AppUser>(
            AppUserDto.fromFirestore(value).toDomain(),
          ),
        )
        .onError((e, s) {
      if (e is FirebaseException && e.code == 'permission-denied') {
        return left(const AppUserFailure.insufficientPermission());
      } else {
        //todo log.error(e.toString())
        return left(const AppUserFailure.unexpected());
      }
    });
  }

  @override
  Future<Either<AppUserFailure, Unit>> create(
      {required AppUser appUser}) async {
    try {
      final userDoc = await _firestore.userDocument();
      final appUserDto = AppUserDto.fromDomain(appUser);
      await userDoc.set(appUserDto.toJson());
      return right(unit);
    } on PlatformException catch (e) {
      if ((e.message ?? '').contains('PERMISSION_DENIED')) {
        return left(const AppUserFailure.insufficientPermission());
      } else {
        //todo log.error(e.toString())
        return left(const AppUserFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<AppUserFailure, Unit>> update(AppUser appUser) async {
    try {
      final userDoc = await _firestore.userDocument();
      final appUserDto = AppUserDto.fromDomain(appUser);
      await userDoc.update(appUserDto.toJson());
      return right(unit);
    } on PlatformException catch (e) {
      if ((e.message ?? '').contains('PERMISSION_DENIED')) {
        return left(const AppUserFailure.insufficientPermission());
      } else {
        //todo log.error(e.toString())
        return left(const AppUserFailure.unexpected());
      }
    }
  }
}
