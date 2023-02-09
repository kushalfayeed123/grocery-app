part of 'sign_in_form_bloc.dart';

@freezed
class SignInFormEvent with _$SignInFormEvent {
  const factory SignInFormEvent.showPasswordChanged(bool showPassword) =
      ShowPasswordChanged;
  const factory SignInFormEvent.emailChanged(String emailStr) = EmailChanged;
  const factory SignInFormEvent.firstNameChanged(String firstNameStr) =
      FirstNameChanged;
  const factory SignInFormEvent.lastNameChanged(String lastNameStr) =
      LastNameChange;
  const factory SignInFormEvent.passwordChanged(String passwordStr) =
      PasswordChanged;
  const factory SignInFormEvent.registerWithEmailAndPassword() =
      RegisterWithEmailAndPassword;
  const factory SignInFormEvent.signInWithEmailAndPassword() =
      SignInWithEmailAndPassword;
  const factory SignInFormEvent.signInWithGooglePressed() =
      SignInWithGooglePressed;
}
