import 'package:another_flushbar/flushbar_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/application/session/session_form/session_form_bloc.dart';
import 'package:grocery_app/injection.dart';
import 'package:grocery_app/presentation/session/create_shopping_list/widget/add_grocery_button.dart';
import 'package:grocery_app/presentation/session/create_shopping_list/widget/shopping_date_field.dart';
import 'package:intl/intl.dart';

import '../../../domain/session/session.dart';
import '../../core/button.dart';
import '../../core/progress_indicator.dart';
import 'widget/grocery_card.dart';

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
                  (_) {
                    FlushbarHelper.createSuccess(
                            message:
                                'Shopping list has been created and a reminder has been set for ${DateFormat.yMMMEd().format(state.session.scheduledDate)}')
                        .show(context);
                  },
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
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Center(
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 20,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        centerTitle: true,
        elevation: 0,
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        title: BlocBuilder<SessionFormBloc, SessionFormState>(
          buildWhen: (p, c) => p.isEditing != c.isEditing,
          builder: (context, state) {
            return Text(
              state.isEditing ? 'Edit shopping list' : 'Create a shopping list',
              style: Theme.of(context).textTheme.titleMedium,
            );
          },
        ),
      ),
      body: BlocBuilder<SessionFormBloc, SessionFormState>(
        // buildWhen: (p, c) => p.autoValidateMode != c.autoValidateMode,
        builder: (context, state) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        ShoppingDateField(),
                        AddGroceryButton(),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    BlocListener<SessionFormBloc, SessionFormState>(
                      listener: (context, state) {},
                      child: Expanded(
                          child: GridView.builder(
                        itemCount: state.session.groceries.length,
                        itemBuilder: (context, index) {
                          final grocery =
                              state.session.groceries.getOrCrash()[index];

                          return grocery.show
                              ? GroceryCard(grocery: grocery)
                              : const SizedBox.shrink();
                        },
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            childAspectRatio: 0.8,
                            mainAxisSpacing: 20,
                            maxCrossAxisExtent:
                                MediaQuery.of(context).size.width / 2),
                      )),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: Container(
        height: 60,
        padding: const EdgeInsets.all(8.0),
        child: CustomButton(
          text: 'SAVE LIST',
          width: MediaQuery.of(context).size.width * 0.45,
          onTap: () {
            context.read<SessionFormBloc>().add(
                  const SessionFormEvent.saved(),
                );
          },
        ),
      ),
    );
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
                'saving...',
                style: Theme.of(context).textTheme.bodyMedium,
              )
            ],
          ),
        ),
      ),
    );
  }
}
