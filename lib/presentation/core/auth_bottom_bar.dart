import 'package:flutter/material.dart';

class AuthBottomBar extends StatelessWidget {
  final Widget bottomWidget;
  final double? height;
  const AuthBottomBar({
    super.key,
    required this.bottomWidget,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        height: height,
        width: MediaQuery.of(context).size.width,
        child: bottomWidget);
  }
}
