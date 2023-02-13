import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:grocery_app/application/session/session_form/session_form_bloc.dart';
import 'package:grocery_app/presentation/session/misc/build_context_x.dart';
import 'package:grocery_app/presentation/session/misc/grocery_item_presentation_classes.dart';
import 'package:kt_dart/collection.dart';
import 'package:provider/provider.dart';

import '../../../../domain/session/value_objects.dart';

class GroceryForm extends HookWidget {
  final int index;
  const GroceryForm({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final grocery = context.formGroceries
        .getOrElse(index, (_) => GroceryItemPrimitive.empty());
    final nameController = useTextEditingController(text: grocery.name);
    final descriptionController =
        useTextEditingController(text: grocery.description);
    final categoryController = useTextEditingController(text: grocery.category);
    final budgetedPriceController =
        useTextEditingController(text: grocery.budgetedPrice.toString());
    final actualPriceController =
        useTextEditingController(text: grocery.actualPrice.toString());
    final quantityController =
        useTextEditingController(text: grocery.quantity.toString());

    return Consumer<FormGroceries>(
      builder: (context, formGroceries, child) {
        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                cursorColor: Theme.of(context).primaryColor,
                keyboardType: TextInputType.name,
                style: Theme.of(context).textTheme.bodyMedium,
                controller: nameController,
                decoration: InputDecoration(
                    label: Text(
                      'Name',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor)),
                    border: const OutlineInputBorder(borderSide: BorderSide())),
                autocorrect: false,
                onChanged: (value) {
                  context.formGroceries = context.formGroceries.map(
                      (listGrocery) => listGrocery == grocery
                          ? grocery.copyWith(name: value)
                          : listGrocery);
                  context.read<SessionFormBloc>().add(
                      SessionFormEvent.groceriesChanged(context.formGroceries));
                },
                validator: (_) => context
                    .read<SessionFormBloc>()
                    .state
                    .session
                    .groceries
                    .value
                    .fold(
                      (f) => null,
                      (groceryList) => groceryList[index].name.value.fold(
                          (f) => f.maybeMap(
                                empty: (_) => 'Can not be empty',
                                exceedingLength: (_) => 'Too long',
                                multiline: (_) => 'Has to be single line',
                                orElse: () => null,
                              ),
                          (_) => null),
                    ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                cursorColor: Theme.of(context).primaryColor,
                keyboardType: TextInputType.text,
                controller: descriptionController,
                style: Theme.of(context).textTheme.bodyMedium,
                maxLength: GroceryDescription.maxLength,
                maxLines: null,
                minLines: 5,
                decoration: InputDecoration(
                    label: Text(
                      'Description',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor)),
                    border: const OutlineInputBorder(borderSide: BorderSide())),
                autocorrect: false,
                onChanged: (value) => context.read<SessionFormBloc>().add(
                    SessionFormEvent.groceriesChanged(context.formGroceries)),
                validator: (_) => context
                    .read<SessionFormBloc>()
                    .state
                    .session
                    .groceries
                    .value
                    .fold(
                      (f) => null,
                      (groceryList) =>
                          groceryList[index].description.value.fold(
                              (f) => f.maybeMap(
                                    empty: (_) => 'Can not be empty',
                                    exceedingLength: (value) =>
                                        'Exceeding length, max: ${value.max}',
                                    orElse: () => null,
                                  ),
                              (_) => null),
                    ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                cursorColor: Theme.of(context).primaryColor,
                keyboardType: TextInputType.number,
                controller: quantityController,
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                    label: Text(
                      'Quantity',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor)),
                    border: const OutlineInputBorder(borderSide: BorderSide())),
                autocorrect: false,
                onChanged: (value) => context.read<SessionFormBloc>().add(
                    SessionFormEvent.groceriesChanged(context.formGroceries)),
                validator: (_) => context
                    .read<SessionFormBloc>()
                    .state
                    .session
                    .groceries
                    .value
                    .fold(
                      (f) => null,
                      (groceryList) => groceryList[index].quantity.value.fold(
                          (f) => f.maybeMap(
                                zeroNumber: (_) => 'Can not be 0',
                                orElse: () => null,
                              ),
                          (_) => null),
                    ),
              ),
            ],
          ),
        );
      },
    );
  }
}
