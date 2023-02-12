import 'package:dartz/dartz.dart';
import 'package:grocery_app/domain/session/session.dart';
import 'package:grocery_app/domain/session/session_failure.dart';
import 'package:kt_dart/collection.dart';

abstract class ISessionRepository {
  Stream<Either<SessionFailure, KtList<Session>>> watchAll();
  Stream<Either<SessionFailure, KtList<Session>>> watchNotStarted();
  Stream<Either<SessionFailure, KtList<Session>>> watchInprogress();
  Stream<Either<SessionFailure, KtList<Session>>> watchCompleted();
  Stream<Either<SessionFailure, KtList<Session>>> watchPaused();
  Future<Either<SessionFailure, Unit>> create(Session session);
  Future<Either<SessionFailure, Unit>> update(Session session);
  Future<Either<SessionFailure, Unit>> delete(Session session);
}
