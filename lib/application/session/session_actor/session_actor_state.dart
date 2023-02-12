part of 'session_actor_bloc.dart';

@freezed
class SessionActorState with _$SessionActorState {
  const factory SessionActorState.initial() = _Initial;
  const factory SessionActorState.actionInProgress() = ActionInProgress;
  const factory SessionActorState.deleteFailure(SessionFailure sessionFailure) =
      DeleteFailure;
  const factory SessionActorState.deleteSuccess() = DeleteSuccess;
}
