import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:grocery_app/domain/session/i_session_repository.dart';
import 'package:grocery_app/infrastructure/core/firestore_helpers.dart';
import 'package:grocery_app/infrastructure/session/session_dtos.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:rxdart/rxdart.dart';

import 'package:grocery_app/domain/session/session_failure.dart';
import 'package:grocery_app/domain/session/session.dart';

import '../../domain/session/status.dart';

@LazySingleton(as: ISessionRepository)
class SessionRepository implements ISessionRepository {
  final FirebaseFirestore _fireStore;
  SessionRepository(this._fireStore);

  @override
  Stream<Either<SessionFailure, KtList<Session>>> watchAll() async* {
    final userDoc = await _fireStore.userDocument();
    yield* userDoc.sessionCollection
        .orderBy('createdDate', descending: true)
        .snapshots()
        .asyncMap(
          (snapshot) => right<SessionFailure, KtList<Session>>(
            snapshot.docs
                .map((doc) => SessionDto.fromFirestore(doc).toDomain())
                .toImmutableList(),
          ),
        )
        .onErrorReturnWith((e, st) {
      if (e is FirebaseException && e.code == 'permission-denied') {
        return left(const SessionFailure.insufficientPermission());
      } else {
        //todo log.error(e.toString())
        return left(const SessionFailure.unexpected());
      }
    });
  }

  @override
  Stream<Either<SessionFailure, KtList<Session>>> watchCompleted() async* {
    final userDoc = await _fireStore.userDocument();
    yield* userDoc.sessionCollection
        .orderBy('createdDate', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => SessionDto.fromFirestore(doc).toDomain()),
        )
        .map((sessions) => right<SessionFailure, KtList<Session>>(sessions
            .where((session) => session.status.getOrCrash() == Status.completed)
            .toImmutableList()))
        .onErrorReturnWith((e, st) {
      if (e is FirebaseException && e.code == 'permission-denied') {
        return left(const SessionFailure.insufficientPermission());
      } else {
        //todo log.error(e.toString())
        return left(const SessionFailure.unexpected());
      }
    });
  }
  // .map((sessions) => right<SessionFailure, KtList<Session>>(sessions
  //         .where((session) => session.groceries
  //             .getOrCrash()
  //             .any((groceryItem) => groceryItem.isInCart))
  //         .toImmutableList()))

  @override
  Stream<Either<SessionFailure, KtList<Session>>> watchInprogress() async* {
    final userDoc = await _fireStore.userDocument();
    yield* userDoc.sessionCollection
        .orderBy('createdDate', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => SessionDto.fromFirestore(doc).toDomain()),
        )
        .map((sessions) => right<SessionFailure, KtList<Session>>(sessions
            .where(
                (session) => session.status.getOrCrash() == Status.inProgress)
            .toImmutableList()))
        .onErrorReturnWith((e, st) {
      if (e is FirebaseException && e.code == 'permission-denied') {
        return left(const SessionFailure.insufficientPermission());
      } else {
        //todo log.error(e.toString())
        return left(const SessionFailure.unexpected());
      }
    });
  }

  @override
  Stream<Either<SessionFailure, KtList<Session>>> watchNotStarted() async* {
    final userDoc = await _fireStore.userDocument();
    yield* userDoc.sessionCollection
        .orderBy('createdDate', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => SessionDto.fromFirestore(doc).toDomain()),
        )
        .map((sessions) => right<SessionFailure, KtList<Session>>(sessions
            .where(
                (session) => session.status.getOrCrash() == Status.notStarted)
            .toImmutableList()))
        .onErrorReturnWith((e, st) {
      if (e is FirebaseException && e.code == 'permission-denied') {
        return left(const SessionFailure.insufficientPermission());
      } else {
        //todo log.error(e.toString())
        return left(const SessionFailure.unexpected());
      }
    });
  }

  @override
  Stream<Either<SessionFailure, KtList<Session>>> watchPaused() async* {
    final userDoc = await _fireStore.userDocument();
    yield* userDoc.sessionCollection
        .orderBy('createdDate', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => SessionDto.fromFirestore(doc).toDomain()),
        )
        .map((sessions) => right<SessionFailure, KtList<Session>>(sessions
            .where((session) => session.status.getOrCrash() == Status.paused)
            .toImmutableList()))
        .onErrorReturnWith((e, st) {
      if (e is FirebaseException && e.code == 'permission-denied') {
        return left(const SessionFailure.insufficientPermission());
      } else {
        //todo log.error(e.toString())
        return left(const SessionFailure.unexpected());
      }
    });
  }

  @override
  Future<Either<SessionFailure, Unit>> create(Session session) async {
    try {
      final userDoc = await _fireStore.userDocument();
      final sessionDto = SessionDto.fromDomain(session);
      await userDoc.sessionCollection
          .doc(sessionDto.id)
          .set(sessionDto.toJson());
      return right(unit);
    } catch (e) {
      if (e is FirebaseException && e.code == 'permission-denied') {
        return left(const SessionFailure.insufficientPermission());
      } else {
        //todo log.error(e.toString())
        return left(const SessionFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<SessionFailure, Unit>> update(Session session) async {
    try {
      final userDoc = await _fireStore.userDocument();
      final sessionDto = SessionDto.fromDomain(session);
      await userDoc.sessionCollection
          .doc(sessionDto.id)
          .update(sessionDto.toJson());
      return right(unit);
    } catch (e) {
      if (e is FirebaseException && e.code == 'permission-denied') {
        return left(const SessionFailure.insufficientPermission());
      } else {
        //todo log.error(e.toString())
        return left(const SessionFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<SessionFailure, Unit>> delete(Session session) async {
    try {
      final userDoc = await _fireStore.userDocument();
      final sessionId = session.id.getOrCrash();
      await userDoc.sessionCollection.doc(sessionId).delete();
      return right(unit);
    } catch (e) {
      if (e is FirebaseException && e.code == 'permission-denied') {
        return left(const SessionFailure.insufficientPermission());
      } else {
        //todo log.error(e.toString())
        return left(const SessionFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<SessionFailure, String>> uploadGroceryImage(File file) async {
    try {
      final uploadRef = FirebaseStorage.instance.ref().child('apple.png');
      await uploadRef.putFile(file);
      final downLoadUrl = await uploadRef.getDownloadURL();
      return right(downLoadUrl);
    } on FirebaseException catch (_) {
      return left(const SessionFailure.unexpected());
    }
  }
}
