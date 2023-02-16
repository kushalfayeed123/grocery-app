import 'package:another_flushbar/flushbar_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/application/session/session_form/session_form_bloc.dart';
import 'package:grocery_app/domain/core/value_object.dart';
import 'package:grocery_app/injection.dart';
import 'package:grocery_app/presentation/session/create_shopping_list/widget/shopping_date_field.dart';
import 'package:grocery_app/presentation/session/misc/build_context_x.dart';
import 'package:grocery_app/presentation/session/misc/grocery_item_presentation_classes.dart';
import 'package:kt_dart/kt.dart';
import 'package:provider/provider.dart';

import '../../../domain/session/session.dart';
import '../../core/button.dart';
import '../../core/progress_indicator.dart';
import 'widget/grocery_form.dart';

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
            SessionFormPageScaffold(),
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
  SessionFormPageScaffold({super.key});

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final categoryController = TextEditingController();
  final budgetedPriceController = TextEditingController();
  final actualPriceController = TextEditingController();
  final quantityController = TextEditingController();

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
          // buildWhen: (p, c) => p.autoValidateMode != c.autoValidateMode,
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
                      ChangeNotifierProvider<FormGroceries>(
                        create: (context) => FormGroceries(),
                        builder: (context, state) {
                          return CustomButton(
                            icon: Icons.add,
                            onTap: () {
                              SessionFormBloc bloc =
                                  context.read<SessionFormBloc>();
                              FormGroceries provider =
                                  context.read<FormGroceries>();
                              context.formGroceries = context.formGroceries
                                  .plusElement(GroceryItemPrimitive.empty());
                              bloc.add(SessionFormEvent.groceriesChanged(
                                  context.formGroceries));
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(
                                      builder: (context, setStateSB) {
                                        return ChangeNotifierProvider.value(
                                          value: provider,
                                          builder: (context, state) {
                                            return AlertDialog(
                                              title: BlocProvider.value(
                                                value: bloc,
                                                child: Stack(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          const Alignment(1, 0),
                                                      child: GestureDetector(
                                                          onTap: () {
                                                            final grocery =
                                                                context
                                                                    .formGroceries
                                                                    .getOrElse(
                                                              context.formGroceries
                                                                      .size -
                                                                  1,
                                                              (_) =>
                                                                  GroceryItemPrimitive
                                                                      .empty(),
                                                            );
                                                            context.formGroceries =
                                                                context
                                                                    .formGroceries
                                                                    .minusElement(
                                                                        grocery);
                                                            bloc.add(SessionFormEvent
                                                                .groceriesChanged(
                                                                    context
                                                                        .formGroceries));
                                                            bloc.add(
                                                                const SessionFormEvent
                                                                    .reset());
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: const Icon(Icons
                                                              .close_rounded)),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.topCenter,
                                                      child: Text(
                                                        'Enter grocery details',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleMedium,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              content: BlocProvider.value(
                                                value: bloc,
                                                child: Form(
                                                  autovalidateMode: bloc
                                                      .state.autoValidateMode,
                                                  child: GroceryForm(
                                                    bloc: bloc,
                                                    setStateSB: setStateSB,
                                                  ),
                                                ),
                                              ),
                                              actions: [
                                                BlocProvider.value(
                                                  value: bloc,
                                                  child: CustomButton(
                                                      text: 'Save',
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      onTap: () {
                                                        setStateSB(() {
                                                          context.formGroceries = context
                                                              .formGroceries
                                                              .map((listGrocery) =>
                                                                  listGrocery.copyWith(
                                                                      show: bloc
                                                                          .state
                                                                          .session
                                                                          .failureOption
                                                                          .isNone()));
                                                          bloc.add(
                                                            SessionFormEvent
                                                                .grocerySaved(
                                                                    context
                                                                        .formGroceries),
                                                          );
                                                          Navigator.pop(
                                                              context);
                                                        });
                                                      }),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    );
                                  });
                            },
                            text: 'Add Grocery',
                          );
                        },
                      ),
                    ],
                  ),
                  BlocListener<SessionFormBloc, SessionFormState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    child: Expanded(
                        child: ListView.builder(
                      itemCount: state.session.groceries.length,
                      itemBuilder: (context, index) {
                        final grocery =
                            state.session.groceries.getOrCrash()[index];

                        return grocery.show
                            ? Card(
                                child: Text(
                                  grocery.name.getOrCrash(),
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              )
                            : const SizedBox.shrink();
                      },
                    )),
                  ),
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
