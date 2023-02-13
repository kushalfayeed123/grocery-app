import 'package:another_flushbar/flushbar_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/application/session/session_form/session_form_bloc.dart';
import 'package:grocery_app/injection.dart';
import 'package:grocery_app/presentation/session/create_shopping_list/widget/shopping_date_field.dart';
import 'package:grocery_app/presentation/session/misc/build_context_x.dart';
import 'package:grocery_app/presentation/session/misc/grocery_item_presentation_classes.dart';
import 'package:kt_dart/kt.dart';
import 'package:provider/provider.dart';

import '../../../domain/session/session.dart';
import '../../core/button.dart';
import '../../core/progress_indicator.dart';
import 'widget/grocery_form.dart.dart';

class CreateShoppingListPage extends StatelessWidget {
  final Session? editedSession;
  const CreateShoppingListPage({super.key, this.editedSession});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SessionFormBloc>()
        ..add(SessionFormEvent.initialized(optionOf(editedSession))),
      child: BlocConsumer<SessionFormBloc, SessionFormState>(
        listener: (context, state) => state.saveFailureOrSuccessOption.fold(
            () => () {},
            (either) => either.fold(
                  (f) => FlushbarHelper.createError(
                    message: f.map(
                      unexpected: (_) =>
                          'Unexpected error occured, please contact support.',
                      insufficientPermission: (_) =>
                          'Insufficient permissions ❌.',
                      unableToUpdate: (_) => 'Could not update the note.',
                    ),
                  ).show(context),
                  (_) => context.router.popUntil(
                    (route) => route.settings.name == '',
                  ),
                )),
        buildWhen: (p, c) => p.isSaving != c.isSaving,
        builder: (context, state) => Stack(
          children: [
            const SessionFormPageScaffold(),
            SavingInProgressOverlay(
              isSaving: state.isSaving,
            )
          ],
        ),
      ),
    );
  }
}

class SessionFormPageScaffold extends StatelessWidget {
  const SessionFormPageScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 0,
          toolbarHeight: MediaQuery.of(context).size.height * 0.1,
          title: BlocBuilder<SessionFormBloc, SessionFormState>(
            buildWhen: (p, c) => p.isEditing != c.isEditing,
            builder: (context, state) {
              return Text(
                state.isEditing
                    ? 'Edit shopping list'
                    : 'Create a shopping list',
                style: Theme.of(context).textTheme.titleMedium,
              );
            },
          ),
        ),
        body: BlocBuilder<SessionFormBloc, SessionFormState>(
          buildWhen: (p, c) =>
              p.session.scheduledDate != c.session.scheduledDate,
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const ShoppingDateField(),
                      CustomButton(
                        icon: Icons.add,
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return ChangeNotifierProvider(
                                  create: (BuildContext context) =>
                                      FormGroceries(),
                                  builder: (context, child) => AlertDialog(
                                    title: Stack(children: [
                                      Align(
                                        alignment: const Alignment(1, 0),
                                        child: GestureDetector(
                                            onTap: () => Navigator.pop(context),
                                            child: const Icon(
                                                Icons.close_rounded)),
                                      ),
                                      Align(
                                        alignment: Alignment.topCenter,
                                        child: Text(
                                          'Enter grocery details',
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                      )
                                    ]),
                                    content: Form(
                                      autovalidateMode: state.autoValidateMode,
                                      child: const GroceryForm(
                                        index: 0,
                                      ),
                                    ),
                                    actions: [
                                      CustomButton(
                                          text: 'Save',
                                          width:
                                              MediaQuery.of(context).size.width,
                                          onTap: () {
                                            context.formGroceries = context
                                                .formGroceries
                                                .plusElement(
                                                    GroceryItemPrimitive
                                                        .empty());
                                            context.read<SessionFormBloc>().add(
                                                  SessionFormEvent
                                                      .groceriesChanged(
                                                    context.formGroceries,
                                                  ),
                                                );
                                            // context.read<SignInFormBloc>().add(
                                            //     const SignInFormEvent.registerWithEmailAndPassword());
                                          }),
                                    ],
                                  ),
                                );
                              });
                        },
                        text: 'Add Grocery',
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ));
  }
}

class SavingInProgressOverlay extends StatelessWidget {
  final bool isSaving;
  const SavingInProgressOverlay({Key? key, required this.isSaving})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !isSaving,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        color: isSaving ? Colors.black.withOpacity(0.8) : Colors.transparent,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Visibility(
          visible: isSaving,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomProgressIndicator(
                showCircular: true,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'saving',
                style: Theme.of(context).textTheme.bodyMedium,
              )
            ],
          ),
        ),
      ),
    );
  }
}