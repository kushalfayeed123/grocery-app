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
                    fontSize: 26,
                    fontWeight: FontWeight.w700),
                titleMedium: GoogleFonts.getFont('Lato').copyWith(
                    color: const Color(0xFF000000),
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
                bodyMedium: GoogleFonts.getFont('Lato')
                    .copyWith(color: const Color(0xFF000000), fontSize: 14),
                bodySmall: GoogleFonts.getFont('Lato').copyWith(
                    color: const Color(0xFF7C7C7C),
                    fontSize: 14,
                    fontWeight: FontWeight.normal),
              ),
              colorScheme: const ColorScheme(
                  brightness: Brightness.light,
                  primary: Color(0xFFFE5152),
                  onPrimary: Colors.white,
                  secondary: Colors.white,
                  onSecondary: Colors.white,
                  error: Colors.red,
                  onError: Colors.red,
                  background: Colors.white,
                  onBackground: Colors.white,
                  surface: Color(0xFF969595),
                  onSurface: Color(0xFF969595)),
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
                // suffixIconColor: Color(0xFFFE5152),
                focusColor: Color(0xFFFE5152),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFFE5152))),
              )),
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
        ));
  }
}
