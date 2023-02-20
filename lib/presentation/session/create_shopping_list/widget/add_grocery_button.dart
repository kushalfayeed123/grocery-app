import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/kt.dart';
import 'package:provider/provider.dart';

import '../../../../application/session/session_form/session_form_bloc.dart';
import '../../../core/button.dart';
import '../../misc/build_context_x.dart';
import '../../misc/grocery_item_presentation_classes.dart';
import 'grocery_form.dart';

class AddGroceryButton extends StatelessWidget {
  const AddGroceryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FormGroceries>(
      create: (context) => FormGroceries(),
      builder: (context, state) {
        return CustomButton(
          icon: Icons.add,
          onTap: () {
            SessionFormBloc bloc = context.read<SessionFormBloc>();
            FormGroceries provider = context.read<FormGroceries>();
            context.formGroceries =
                context.formGroceries.plusElement(GroceryItemPrimitive.empty());
            bloc.add(SessionFormEvent.groceriesChanged(context.formGroceries));
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
                                    alignment: const Alignment(1, 0),
                                    child: GestureDetector(
                                        onTap: () {
                                          final grocery =
                                              context.formGroceries.getOrElse(
                                            context.formGroceries.size - 1,
                                            (_) => GroceryItemPrimitive.empty(),
                                          );
                                          context.formGroceries = context
                                              .formGroceries
                                              .minusElement(grocery);
                                          bloc.add(
                                              SessionFormEvent.groceriesChanged(
                                                  context.formGroceries));
                                          bloc.add(
                                              const SessionFormEvent.reset());
                                          Navigator.pop(context);
                                        },
                                        child: const Icon(Icons.close_rounded)),
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
                                ],
                              ),
                            ),
                            content: BlocProvider.value(
                              value: bloc,
                              child: Form(
                                autovalidateMode: bloc.state.autoValidateMode,
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
                                    width: MediaQuery.of(context).size.width,
                                    onTap: () {
                                      setStateSB(() {
                                        context.formGroceries = context
                                            .formGroceries
                                            .map((listGrocery) =>
                                                listGrocery.copyWith(
                                                    show: bloc.state.session
                                                        .failureOption
                                                        .isNone()));
                                        bloc.add(
                                          SessionFormEvent.grocerySaved(
                                              context.formGroceries),
                                        );
                                        Navigator.pop(context);
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
    );
  }
}
