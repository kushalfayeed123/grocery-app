part of 'session_form_bloc.dart';

@freezed
class SessionFormState with _$SessionFormState {
  const factory SessionFormState({
    required Session session,
    required AutovalidateMode autoValidateMode,
    required String downloadUrl,
    required bool isUploading,
    required bool isSaving,
    required bool isEditing,
    required Option<Either<SessionFailure, Unit>> saveFailureOrSuccessOption,
  }) = _SessionFormState;
  factory SessionFormState.initial() => SessionFormState(
      session: Session.empty(),
      autoValidateMode: AutovalidateMode.disabled,
      isSaving: false,
      isEditing: false,
      saveFailureOrSuccessOption: none(),
      downloadUrl: '',
      isUploading: false);
}
