import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grocery_app/domain/app_user/value_objects.dart';
import '../../../domain/app_user/app_user.dart';
import '../../../domain/app_user/app_user_failure.dart';
import '../../../domain/app_user/i_app_user_repository.dart';
import '../../../domain/auth/auth_failure.dart';
import '../../../domain/auth/i_auth_facade.dart';
import '../../../domain/auth/value_objects.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/core/value_object.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';
part 'sign_in_form_bloc.freezed.dart';

@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;
  final IAppUserRepository _appUserRepository;
  SignInFormBloc(this._authFacade, this._appUserRepository)
      : super(_SignInFormState(
            authFailureOrSuccess: none(),
            appUser: AppUser(
                emailAddress: EmailAddress(''),
                firstName: FirstName(''),
                id: UniqueId(),
                lastName: LastName('')),
            autovalidateMode: AutovalidateMode.disabled,
            emailAddress: EmailAddress(''),
            isSubmitting: false,
            password: Password(''),
            saveFailureOrSuccessOption: none())) {
    on<SignInFormEvent>((event, emit) async {
      emit(await event.map(
        emailChanged: (e) => state.copyWith(
          emailAddress: EmailAddress(e.emailStr),
          appUser: state.appUser.copyWith(
            emailAddress: EmailAddress(e.emailStr),
          ),
          authFailureOrSuccess: none(),
        ),
        passwordChanged: (e) => state.copyWith(
            password: Password(e.passwordStr), authFailureOrSuccess: none()),
        firstNameChanged: (e) {
          emit(
            state.copyWith(
                appUser: state.appUser
                    .copyWith(firstName: FirstName(e.firstNameStr)),
                saveFailureOrSuccessOption: none()),
          );
          return state;
        },
        lastNameChanged: (e) {
          emit(
            state.copyWith(
                appUser:
                    state.appUser.copyWith(lastName: LastName(e.lastNameStr)),
                saveFailureOrSuccessOption: none()),
          );
          return state;
        },
        registerWithEmailAndPassword: (e) async {
          await _performActionOnAuthFacadeWithEmailAndPassword(
              emit, _authFacade.registerWithEmailandPassword);
          await _performActionOnUserRespositoryWithEmailAndPassword(
              emit, _appUserRepository.create);
          return state;
        },
        signInWithEmailAndPassword: (e) async {
          await _performActionOnAuthFacadeWithEmailAndPassword(
            emit,
            _authFacade.signInWithEmailandPassword,
          );
          return state;
        },
        signInWithGooglePressed: (e) async {
          emit(
            state.copyWith(isSubmitting: true, authFailureOrSuccess: none()),
          );
          final failureOrSuccess = await _authFacade.signInWithGoogle();
          emit(state.copyWith(
            isSubmitting: false,
            authFailureOrSuccess: some(failureOrSuccess),
          ));

          return state;
        },
      ));
    });
  }

  Future<SignInFormState> _performActionOnUserRespositoryWithEmailAndPassword(
    Emitter<SignInFormState> emit,
    Future<Either<AppUserFailure, Unit>> Function({required AppUser appUser})
        forwardedCall,
  ) async {
    Either<AppUserFailure, Unit>? saveFailureOrSuccess;
    emit(state.copyWith(saveFailureOrSuccessOption: none()));
    saveFailureOrSuccess = await forwardedCall(appUser: state.appUser);
    emit(state.copyWith(
        saveFailureOrSuccessOption: optionOf(saveFailureOrSuccess)));
    return state;
  }

  Future<SignInFormState> _performActionOnAuthFacadeWithEmailAndPassword(
    Emitter<SignInFormState> emit,
    Future<Either<AuthFailure, Unit>> Function(
            {required EmailAddress emailAddress, required Password password})
        forwardedCall,
  ) async {
    bool isEmailValid = state.emailAddress.isValid();
    bool isPasswordValid = state.password.isValid();
    Either<AuthFailure, Unit>? failureOrSuccess;

    if (isEmailValid && isPasswordValid) {
      emit(state.copyWith(
        isSubmitting: true,
        authFailureOrSuccess: none(),
      ));
      failureOrSuccess = await forwardedCall(
        emailAddress: state.emailAddress,
        password: state.password,
      );
    }
    emit(state.copyWith(
      isSubmitting: false,
      autovalidateMode: AutovalidateMode.always,
      authFailureOrSuccess: optionOf(failureOrSuccess),
    ));
    return state;
  }
}
