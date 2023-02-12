import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grocery_app/domain/session/i_session_repository.dart';
import 'package:grocery_app/domain/session/session_failure.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/session/session.dart';

part 'session_actor_event.dart';
part 'session_actor_state.dart';
part 'session_actor_bloc.freezed.dart';

@injectable
class SessionActorBloc extends Bloc<SessionActorEvent, SessionActorState> {
  final ISessionRepository _sessionRepository;
  SessionActorBloc(this._sessionRepository) : super(const _Initial()) {
    on<SessionActorEvent>((event, emit) async {
      emit(const SessionActorState.actionInProgress());
      final possibleFailure = await _sessionRepository.delete(event.session);
      emit(possibleFailure.fold(
        (f) => SessionActorState.deleteFailure(f),
        (r) => const SessionActorState.deleteSuccess(),
      ));
    });
  }
}
