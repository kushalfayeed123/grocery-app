part of 'session_watcher_bloc.dart';

@freezed
class SessionWatcherState with _$SessionWatcherState {
  const factory SessionWatcherState.initial() = _Initial;
  const factory SessionWatcherState.loadInProgress() = _LoadInProgress;
  const factory SessionWatcherState.loadSuccess(KtList<Session> sessions) =
      _LoadSuccess;
  const factory SessionWatcherState.loadFailure(SessionFailure noteFailure) =
      _LoadFailure;
}
