import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grocery_app/domain/session/i_session_repository.dart';
import 'package:grocery_app/domain/session/value_objects.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';

import '../../../domain/session/session.dart';
import '../../../domain/session/session_failure.dart';
import '../../../presentation/session/misc/grocery_item_presentation_classes.dart';

part 'session_form_event.dart';
part 'session_form_state.dart';
part 'session_form_bloc.freezed.dart';

@injectable
class SessionFormBloc extends Bloc<SessionFormEvent, SessionFormState> {
  final ISessionRepository _sessionRepository;

  SessionFormBloc(this._sessionRepository) : super(SessionFormState.initial()) {
    on<SessionFormEvent>((event, emit) async {
      emit(await event.map(
        reset: (_) {
          emit(state.copyWith(
            isSaving: false,
            autoValidateMode: AutovalidateMode.disabled,
          ));
          return state;
        },
        initialized: (e) async {
          emit(await e.initialOption.fold(
              () => state,
              (initialSession) =>
                  state.copyWith(session: initialSession, isEditing: true)));
          return state;
        },
        totalBudgetedPriceChanged: (_) {
          final budgetedPrices = state.session.groceries
              .getOrCrash()
              .map(
                  (f) => f.budgetedPrice.getOrCrash() * f.quantity.getOrCrash())
              .asList();

          final totalBudgetPrice = budgetedPrices.reduce(
            (acc, p1) => acc + p1,
          );
          emit(state.copyWith(
              session: state.session.copyWith(
                  totalBudgetedPrice: ValidatedNumber(totalBudgetPrice)),
              saveFailureOrSuccessOption: none()));
          return state;
        },
        totalActualPriceChanged: (_) {
          final actualPrices = state.session.groceries
              .getOrCrash()
              .map((f) => f.actualPrice * f.quantity.getOrCrash())
              .asList();

          final totalActualPrice = actualPrices.reduce(
            (acc, p1) => acc + p1,
          );
          emit(state.copyWith(
              session:
                  state.session.copyWith(totalActualPrice: totalActualPrice),
              saveFailureOrSuccessOption: none()));
          return state;
        },
        groceriesChanged: (e) {
          emit(
            state.copyWith(
                session: state.session.copyWith(
                  groceries: GList(
                      e.groceries.map((primitive) => primitive.toDomain())),
                ),
                saveFailureOrSuccessOption: none()),
          );
          return state;
        },
        statusChanged: (e) {
          emit(state.copyWith(
              session:
                  state.session.copyWith(status: SessionStatus(e.statusStr)),
              saveFailureOrSuccessOption: none()));
          return state;
        },
        scheduledDateChanged: (e) {
          emit(state.copyWith(
              session: state.session.copyWith(scheduledDate: e.scheduledDate),
              saveFailureOrSuccessOption: none()));
          return state;
        },
        grocerySaved: (e) async {
          if (state.session.failureOption.isNone()) {
            emit(state.copyWith(
              isSaving: false,
              autoValidateMode: AutovalidateMode.disabled,
              session: state.session.copyWith(
                groceries: GList(e.groceries.map(
                  (primitive) => primitive.toDomain(),
                )),
              ),
              saveFailureOrSuccessOption: none(),
            ));
          }
          emit(state.copyWith(
            isSaving: false,
            autoValidateMode: AutovalidateMode.always,
          ));
          return state;
        },
        saved: (_) async {
          Either<SessionFailure, Unit>? failureOrSuccess;

          emit(state.copyWith(
            isSaving: true,
            saveFailureOrSuccessOption: none(),
          ));

          if (state.session.failureOption.isNone()) {
            failureOrSuccess = state.isEditing
                ? await _sessionRepository.update(state.session)
                : await _sessionRepository.create(state.session);
          }
          emit(state.copyWith(
            isSaving: false,
            autoValidateMode: AutovalidateMode.disabled,
            saveFailureOrSuccessOption: optionOf(failureOrSuccess),
          ));
          return state;
        },
        uploadImage: (_) async {
          Either<SessionFailure, String>? failureOrSuccess;
          final ImagePicker _picker = ImagePicker();
          emit(state.copyWith(
            isUploading: true,
            downloadUrl: '',
          ));

          final XFile? image =
              await _picker.pickImage(source: ImageSource.gallery);
          final file = File(image!.path);
          failureOrSuccess = await _sessionRepository.uploadGroceryImage(file);
          emit(state.copyWith(
            isUploading: false,
            downloadUrl: failureOrSuccess.fold((l) => '', (r) => r),
          ));

          return state;
        },
      ));
    });
  }
}
