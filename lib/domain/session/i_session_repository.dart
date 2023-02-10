import 'package:dartz/dartz.dart';
import 'package:grocery_app/domain/session/session.dart';
import 'package:grocery_app/domain/session/session_failure.dart';
import 'package:kt_dart/collection.dart';
import 'package:provider/provider.dart';

abstract class ISessionRepository {
  Future<Either<SessionFailure, KtList<Session>>> watchAll();
  Future<Either<SessionFailure, KtList<Session>>> watchNotStarted();
  Future<Either<SessionFailure, KtList<Session>>> watchInprogress();
  Future<Either<SessionFailure, KtList<Session>>> watchCompleted();
  Future<Either<SessionFailure, KtList<Session>>> watchPaused();
  Future<Either<SessionFailure, Unit>> create(Session session);
  Future<Either<SessionFailure, Unit>> update(Session session);
  Future<Either<SessionFailure, Unit>> delete(Session session);
}
