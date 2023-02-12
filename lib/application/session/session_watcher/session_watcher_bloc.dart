import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grocery_app/domain/session/i_session_repository.dart';
import 'package:grocery_app/domain/session/session.dart';
import 'package:grocery_app/domain/session/session_failure.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';

part 'session_watcher_event.dart';
part 'session_watcher_state.dart';
part 'session_watcher_bloc.freezed.dart';

@injectable
class SessionWatcherBloc
    extends Bloc<SessionWatcherEvent, SessionWatcherState> {
  final ISessionRepository _sessionRepository;
  StreamSubscription<Either<SessionFailure, KtList<Session>>>?
      sessionStreamSubscription;

  SessionWatcherBloc(this._sessionRepository) : super(const _Initial()) {
    on<SessionWatcherEvent>((event, emit) async {
      emit(await event.map(watchAllStarted: (_) async {
        emit(const SessionWatcherState.loadInProgress());
        await sessionStreamSubscription?.cancel();
        sessionStreamSubscription = _sessionRepository.watchAll().listen(
              (failureOrSessions) => add(
                SessionWatcherEvent.sessionsReceived(failureOrSessions),
              ),
            );
        return state;
      }, watchCompletedStarted: (_) async {
        emit(const SessionWatcherState.loadInProgress());
        await sessionStreamSubscription?.cancel();
        sessionStreamSubscription = _sessionRepository.watchCompleted().listen(
              (failureOrSessions) => add(
                SessionWatcherEvent.sessionsReceived(failureOrSessions),
              ),
            );
        return state;
      }, watchInprogressStarted: (_) async {
        emit(const SessionWatcherState.loadInProgress());
        await sessionStreamSubscription?.cancel();
        sessionStreamSubscription = _sessionRepository.watchInprogress().listen(
              (failureOrSessions) => add(
                SessionWatcherEvent.sessionsReceived(failureOrSessions),
              ),
            );
        return state;
      }, watchPausedStarted: (_) async {
        emit(const SessionWatcherState.loadInProgress());
        await sessionStreamSubscription?.cancel();
        sessionStreamSubscription = _sessionRepository.watchPaused().listen(
              (failureOrSessions) => add(
                SessionWatcherEvent.sessionsReceived(failureOrSessions),
              ),
            );
        return state;
      }, watchNotStartedStarted: (_) async {
        emit(const SessionWatcherState.loadInProgress());
        await sessionStreamSubscription?.cancel();
        sessionStreamSubscription = _sessionRepository.watchNotStarted().listen(
              (failureOrSessions) => add(
                SessionWatcherEvent.sessionsReceived(failureOrSessions),
              ),
            );
        return state;
      }, sessionsReceived: (e) {
        emit(
          e.failureOrSessions.fold(
            (f) => SessionWatcherState.loadFailure(f),
            (sessions) => SessionWatcherState.loadSuccess(sessions),
          ),
        );
        return state;
      }));
    });
  }

  @override
  Future<void> close() async {
    await sessionStreamSubscription?.cancel();
    return super.close();
  }
}
