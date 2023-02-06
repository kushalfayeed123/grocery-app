import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/presentation/sign_up/widgets/sign_up_form.dart';
import '../../injection.dart';

import '../../application/auth/sign_in_form/sign_in_form_bloc.dart';
import '../core/auth_app_bar.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size(100, 100), child: AuthAppBar()),
      body: BlocProvider(
        create: (context) => getIt<SignInFormBloc>(),
        child: const SignUpForm(),
      ),
    );
  }
}