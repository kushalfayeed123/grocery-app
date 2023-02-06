import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../route/router.gr.dart';

import '../../application/auth/auth_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.map(
          initial: (_) {},
          authenticated: (_) {},
          unAuthenticated: (_) => context.navigateTo(const SignInRoute()),
        );
      },
      child: const Scaffold(
        backgroundColor: Color(0xFFFE5152),
        body: Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.white,
            color: Color(0xFFFE5152),
          ),
        ),
      ),
    );
  }
}
