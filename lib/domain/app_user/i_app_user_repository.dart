import 'package:dartz/dartz.dart';
import 'package:grocery_app/domain/app_user/app_user_failure.dart';

import 'app_user.dart';

abstract class IAppUserRepository {
  Future<Either<AppUserFailure, AppUser>> watchUser();
  Future<Either<AppUserFailure, Unit>> create({required AppUser appUser});
  Future<Either<AppUserFailure, Unit>> update(AppUser appUser);
}
