import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../application/auth/auth_bloc.dart';
import '../../injection.dart';
import '../route/router.gr.dart';

class AppWidget extends StatelessWidget {
  AppWidget({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    final themeData = ThemeData.light();

    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<AuthBloc>()
              ..add(
                const AuthEvent.authCheckRequested(),
              ),
          ),
        ],
        child: MaterialApp.router(
          title: 'Grocery App',
          debugShowCheckedModeBanner: false,
          theme: themeData.copyWith(
              textTheme: TextTheme(
                titleLarge: GoogleFonts.getFont('Lato').copyWith(
                    color: const Color(0xFF000000),
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
                bodyMedium: GoogleFonts.getFont('Lato')
                    .copyWith(color: const Color(0xFF000000)),
                bodySmall: GoogleFonts.getFont('Lato')
                    .copyWith(color: const Color(0xFF7C7C7C), fontSize: 12),
              ),
              primaryColorDark: const Color(0xFFFE5152),
              primaryColorLight: const Color(0xFFFE5152),
              primaryColor: const Color(0xFFFE5152),
              appBarTheme: const AppBarTheme(
                backgroundColor: Color(0xFFFFFFFF),
              ),
              scaffoldBackgroundColor: const Color(0xFFFFFFFF),
              elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => const Color(0xFFFE5152)))),
              checkboxTheme: CheckboxThemeData(
                  fillColor: MaterialStateColor.resolveWith(
                      (states) => const Color(0xFFFFFFFF))),
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  backgroundColor: Color(0xFFFF8082)),
              inputDecorationTheme: const InputDecorationTheme(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFFE5152))),
              )),
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
        ));
  }
}