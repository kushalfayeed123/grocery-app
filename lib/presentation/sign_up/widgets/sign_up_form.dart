import 'package:another_flushbar/flushbar_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:grocery_app/presentation/core/auth_bottom_bar.dart';
import 'package:grocery_app/presentation/core/button.dart';
import 'package:grocery_app/presentation/route/router.gr.dart';

import '../../../application/auth/auth_bloc.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {
        state.authFailureOrSuccess.fold(
          () {},
          (either) => either.fold(
            (failure) {
              FlushbarHelper.createError(
                      message: failure.map(
                          canceledByUser: (_) => 'Cancelled',
                          serverError: (_) => 'Server Error',
                          emailAlreadyInUse: (_) => 'Email already in use',
                          invalidEmailandPasswordCombination: (_) =>
                              'Invalid email and password combination'))
                  .show(context);
            },
            (_) {
              FlushbarHelper.createSuccess(
                      message: 'Your account has been created successfully')
                  .show(context);
              context
                  .read<AuthBloc>()
                  .add(const AuthEvent.authCheckRequested());
            },
          ),
        );
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(
            top: 20,
          ),
          child: Form(
            autovalidateMode:
                context.read<SignInFormBloc>().state.autovalidateMode,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign Up',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Enter your credentials to continue',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        cursorColor: const Color(0xFFFE5152),
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                            label: Text(
                          'First Name',
                          style: Theme.of(context).textTheme.bodySmall,
                        )),
                        autocorrect: false,
                        onChanged: (value) => context
                            .read<SignInFormBloc>()
                            .add(SignInFormEvent.firstNameChanged(value)),
                        validator: (_) => context
                            .read<SignInFormBloc>()
                            .state
                            .appUser
                            .firstName
                            .value
                            .fold(
                              (f) => f.maybeMap(
                                empty: (_) => 'First name can not be empty',
                                orElse: () => null,
                              ),
                              (_) => null,
                            ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        cursorColor: const Color(0xFFFE5152),
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                            label: Text(
                          'Last Name',
                          style: Theme.of(context).textTheme.bodySmall,
                        )),
                        autocorrect: false,
                        onChanged: (value) => context
                            .read<SignInFormBloc>()
                            .add(SignInFormEvent.lastNameChanged(value)),
                        validator: (_) => context
                            .read<SignInFormBloc>()
                            .state
                            .appUser
                            .lastName
                            .value
                            .fold(
                              (f) => f.maybeMap(
                                empty: (_) => 'Last name can not be empty',
                                orElse: () => null,
                              ),
                              (_) => null,
                            ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        cursorColor: const Color(0xFFFE5152),
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                            label: Text(
                          'Email',
                          style: Theme.of(context).textTheme.bodySmall,
                        )),
                        autocorrect: false,
                        onChanged: (value) {
                          context
                              .read<SignInFormBloc>()
                              .add(SignInFormEvent.emailChanged(value));
                        },
                        validator: (_) => context
                            .read<SignInFormBloc>()
                            .state
                            .emailAddress
                            .value
                            .fold(
                              (f) => f.maybeMap(
                                invalidEmail: (_) => 'Invalid Email',
                                orElse: () => null,
                              ),
                              (_) => null,
                            ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        cursorColor: const Color(0xFFFE5152),
                        style: Theme.of(context).textTheme.bodyMedium,
                        obscureText: true,
                        decoration: InputDecoration(
                            suffixIcon: const Icon(
                              Icons.visibility,
                              color: Color(0xFFFE5152),
                            ),
                            label: Text(
                              'Password',
                              style: Theme.of(context).textTheme.bodySmall,
                            )),
                        autocorrect: false,
                        onChanged: (value) => context
                            .read<SignInFormBloc>()
                            .add(SignInFormEvent.passwordChanged(value)),
                        validator: (_) => context
                            .read<SignInFormBloc>()
                            .state
                            .password
                            .value
                            .fold(
                              (f) => f.maybeMap(
                                shortPassword: (_) => 'Password is too short',
                                orElse: () => null,
                              ),
                              (_) => null,
                            ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Wrap(
                        children: [
                          RichText(
                              text: TextSpan(
                                  text: 'By continuing you agree to our',
                                  style: Theme.of(context).textTheme.bodySmall,
                                  children: [
                                TextSpan(
                                    text: 'Terms of Service',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                            color: const Color(0xFFFE5152))),
                                TextSpan(
                                  text: ' and',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                TextSpan(
                                    text: ' Privacy Policy',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                            color: const Color(0xFFFE5152))),
                              ])),
                        ],
                      ),
                      if (state.isSubmitting) ...[
                        const SizedBox(
                          height: 8,
                        ),
                        const LinearProgressIndicator(
                          backgroundColor: Colors.white,
                          color: Color(0xFFFE5152),
                          value: null,
                        ),
                      ],
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                          text: 'SIGN UP',
                          onTap: () {
                            context.read<SignInFormBloc>().add(
                                const SignInFormEvent
                                    .registerWithEmailAndPassword());
                          }),
                    ],
                  ),
                ),
                AuthBottomBar(
                  height: MediaQuery.of(context).size.height * 0.12,
                  bottomWidget: Center(
                    child: GestureDetector(
                      onTap: () => context.navigateTo(const SignInRoute()),
                      child: RichText(
                        text: TextSpan(
                          text: 'Already have an account?',
                          style: Theme.of(context).textTheme.bodySmall,
                          children: [
                            TextSpan(
                              text: ' Sign In',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: const Color(0xFFFE5152),
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
