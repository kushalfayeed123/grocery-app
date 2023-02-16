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
  final SessionFormBloc bloc;
  final Function setStateSB;
  const GroceryForm({super.key, required this.bloc, required this.setStateSB});

  @override
  Widget build(BuildContext context) {
    final index = context.formGroceries.size - 1;
    final grocery = context.formGroceries.getOrElse(
      index,
      (_) => GroceryItemPrimitive.empty(),
    );

    final nameController = useTextEditingController(text: grocery.name);
    final categoryController = useTextEditingController(text: grocery.name);
    final descriptionController =
        useTextEditingController(text: grocery.description);
    final quantityController =
        useTextEditingController(text: grocery.quantity.toString());
    final priceController =
        useTextEditingController(text: grocery.budgetedPrice.toString());

    return Consumer<FormGroceries>(
      builder: (context, formGroceries, state) {
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
                  setStateSB(() {
                    context.formGroceries = context.formGroceries.map(
                        (listGrocery) => listGrocery == grocery
                            ? grocery.copyWith(
                                name: nameController.text, show: false)
                            : listGrocery);
                    bloc.add(SessionFormEvent.groceriesChanged(
                        context.formGroceries));
                  });
                },
                validator: (_) => bloc.state.session.groceries.value.fold(
                  (f) => null,
                  (groceryList) {
                    return groceryList[index].name.value.fold(
                        (f) => f.maybeMap(
                              empty: (_) => 'Can not be empty',
                              exceedingLength: (_) => 'Too long',
                              multiline: (_) => 'Has to be single line',
                              orElse: () => null,
                            ),
                        (_) => null);
                  },
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
                    counterText: '',
                    label: Text(
                      'Description',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor)),
                    border: const OutlineInputBorder(borderSide: BorderSide())),
                autocorrect: false,
                onChanged: (value) {
                  setStateSB(() {
                    context.formGroceries = context.formGroceries.map(
                        (listGrocery) => listGrocery == grocery
                            ? grocery.copyWith(
                                description: descriptionController.text,
                                show: false)
                            : listGrocery);
                    bloc.add(SessionFormEvent.groceriesChanged(
                        context.formGroceries));
                  });
                },
                validator: (_) {
                  return bloc.state.session.groceries.value.fold(
                    (f) => null,
                    (groceryList) {
                      return groceryList[index].description.value.fold(
                          (f) => f.maybeMap(
                                empty: (_) => 'Can not be empty',
                                exceedingLength: (_) => 'Too long',
                                orElse: () => null,
                              ),
                          (_) => null);
                    },
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                cursorColor: Theme.of(context).primaryColor,
                keyboardType: TextInputType.text,
                controller: categoryController,
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                    label: Text(
                      'Category',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor)),
                    border: const OutlineInputBorder(borderSide: BorderSide())),
                autocorrect: false,
                onChanged: (value) {
                  setStateSB(() {
                    context.formGroceries = context.formGroceries.map(
                        (listGrocery) => listGrocery == grocery
                            ? grocery.copyWith(
                                category: categoryController.text, show: false)
                            : listGrocery);
                    bloc.add(SessionFormEvent.groceriesChanged(
                        context.formGroceries));
                  });
                },
                validator: (_) {
                  return bloc.state.session.groceries.value.fold(
                    (f) => null,
                    (groceryList) {
                      return groceryList[index].category.value.fold(
                          (f) => f.maybeMap(
                                empty: (value) => 'Can not be empty',
                                exceedingLength: (_) => 'Too long',
                                orElse: () => null,
                              ),
                          (_) => null);
                    },
                  );
                },
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
                onChanged: (value) {
                  setStateSB(() {
                    context.formGroceries = context.formGroceries.map(
                        (listGrocery) => listGrocery == grocery
                            ? grocery.copyWith(
                                quantity: int.parse(quantityController.text),
                                show: false)
                            : listGrocery);
                    bloc.add(SessionFormEvent.groceriesChanged(
                        context.formGroceries));
                  });
                },
                validator: (_) => bloc.state.session.groceries.value.fold(
                  (f) => null,
                  (groceryList) => groceryList[index].quantity.value.fold(
                      (f) => f.maybeMap(
                            zeroNumber: (_) => 'Can not be 0',
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
                controller: priceController,
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                    label: Text(
                      'Budget Price',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor)),
                    border: const OutlineInputBorder(borderSide: BorderSide())),
                autocorrect: false,
                onChanged: (value) {
                  setStateSB(() {
                    context.formGroceries = context.formGroceries.map(
                        (listGrocery) => listGrocery == grocery
                            ? grocery.copyWith(
                                budgetedPrice: int.parse(priceController.text),
                                show: false)
                            : listGrocery);
                    bloc.add(SessionFormEvent.groceriesChanged(
                        context.formGroceries));
                  });
                },
                validator: (_) => bloc.state.session.groceries.value.fold(
                  (f) => null,
                  (groceryList) => groceryList[index].budgetedPrice.value.fold(
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
