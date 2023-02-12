// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i5;
import 'package:grocery_app/application/auth/auth_bloc.dart' as _i16;
import 'package:grocery_app/application/auth/sign_in_form/sign_in_form_bloc.dart'
    as _i15;
import 'package:grocery_app/application/session/session_actor/session_actor_bloc.dart'
    as _i12;
import 'package:grocery_app/application/session/session_form/session_form_bloc.dart'
    as _i13;
import 'package:grocery_app/application/session/session_watcher/session_watcher_bloc.dart'
    as _i14;
import 'package:grocery_app/domain/app_user/i_app_user_repository.dart' as _i6;
import 'package:grocery_app/domain/auth/i_auth_facade.dart' as _i8;
import 'package:grocery_app/domain/session/i_session_repository.dart' as _i10;
import 'package:grocery_app/infrastructure/app_user/app_user_repository.dart'
    as _i7;
import 'package:grocery_app/infrastructure/auth/firebase_auth_facade.dart'
    as _i9;
import 'package:grocery_app/infrastructure/core/firestore_injectable_module.dart'
    as _i17;
import 'package:grocery_app/infrastructure/session/session_repository.dart'
    as _i11;
import 'package:injectable/injectable.dart' as _i2;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of main-scope dependencies inside of [GetIt]
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  gh.lazySingleton<_i3.FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<_i4.FirebaseFirestore>(
      () => firebaseInjectableModule.firebaseFirestore);
  gh.lazySingleton<_i5.GoogleSignIn>(
      () => firebaseInjectableModule.googleSigIn);
  gh.lazySingleton<_i6.IAppUserRepository>(
      () => _i7.AppUserRepository(gh<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i8.IAuthFacade>(() => _i9.FirebaseAuthFacade(
        gh<_i3.FirebaseAuth>(),
        gh<_i5.GoogleSignIn>(),
      ));
  gh.lazySingleton<_i10.ISessionRepository>(
      () => _i11.SessionRepository(gh<_i4.FirebaseFirestore>()));
  gh.factory<_i12.SessionActorBloc>(
      () => _i12.SessionActorBloc(gh<_i10.ISessionRepository>()));
  gh.factory<_i13.SessionFormBloc>(
      () => _i13.SessionFormBloc(gh<_i10.ISessionRepository>()));
  gh.factory<_i14.SessionWatcherBloc>(
      () => _i14.SessionWatcherBloc(gh<_i10.ISessionRepository>()));
  gh.factory<_i15.SignInFormBloc>(() => _i15.SignInFormBloc(
        gh<_i8.IAuthFacade>(),
        gh<_i6.IAppUserRepository>(),
      ));
  gh.factory<_i16.AuthBloc>(() => _i16.AuthBloc(gh<_i8.IAuthFacade>()));
  return getIt;
}

class _$FirebaseInjectableModule extends _i17.FirebaseInjectableModule {}
