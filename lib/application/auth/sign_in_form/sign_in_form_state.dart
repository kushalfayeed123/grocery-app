part of 'sign_in_form_bloc.dart';

@freezed
class SignInFormState with _$SignInFormState {
  const factory SignInFormState({
    required EmailAddress emailAddress,
    required Password password,
    required AppUser appUser,
    required bool isSubmitting,
    required AutovalidateMode autovalidateMode,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccess,
    required Option<Either<AppUserFailure, Unit>> saveFailureOrSuccessOption,
  }) = _SignInFormState;
}
