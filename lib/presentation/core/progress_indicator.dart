import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  final bool showCircular;
  const CustomProgressIndicator({super.key, required this.showCircular});

  @override
  Widget build(BuildContext context) {
    return !showCircular
        ? LinearProgressIndicator(
            backgroundColor: Colors.white,
            color: Theme.of(context).primaryColor,
            value: null,
          )
        : CircularProgressIndicator(
            backgroundColor: Colors.white,
            color: Theme.of(context).primaryColor,
          );
  }
}
