part of 'session_watcher_bloc.dart';

@freezed
class SessionWatcherEvent with _$SessionWatcherEvent {
  const factory SessionWatcherEvent.watchAllStarted() = _WatchAllStarted;
  const factory SessionWatcherEvent.watchCompletedStarted() =
      _WatchCompletedStarted;
  const factory SessionWatcherEvent.watchInprogressStarted() =
      _WatchInprogressStarted;
  const factory SessionWatcherEvent.watchPausedStarted() = _WatchPausedStarted;
  const factory SessionWatcherEvent.watchNotStartedStarted() =
      _WatchNotStartedStarted;
  const factory SessionWatcherEvent.sessionsReceived(
          Either<SessionFailure, KtList<Session>> failureOrSessions) =
      _SessionsReceived;
}
