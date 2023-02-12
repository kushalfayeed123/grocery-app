part of 'session_actor_bloc.dart';

@freezed
class SessionActorEvent with _$SessionActorEvent {
  const factory SessionActorEvent.deleted(Session session) = _Deleted;
}
