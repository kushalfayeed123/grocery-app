import 'package:flutter/material.dart';
import 'package:grocery_app/presentation/session/misc/grocery_item_presentation_classes.dart';
import 'package:kt_dart/kt.dart';
import 'package:provider/provider.dart';

extension FormGroceriesX on BuildContext {
  KtList<GroceryItemPrimitive> get formGroceries =>
      Provider.of<FormGroceries>(this, listen: false).value;

  set formGroceries(KtList<GroceryItemPrimitive> value) {
    Provider.of<FormGroceries>(this, listen: false).value = value;
  }
}
