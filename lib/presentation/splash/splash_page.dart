import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/progress_indicator.dart';
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
          authenticated: (_) {
            context.navigateTo(const SignInRoute());
          },
          unAuthenticated: (_) => context.navigateTo(const SignInRoute()),
        );
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: const Center(
          child: CustomProgressIndicator(
            showCircular: true,
          ),
        ),
      ),
    );
  }
}
