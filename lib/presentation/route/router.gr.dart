// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../../domain/session/session.dart' as _i7;
import '../session/create_shopping_list/create_shopping_list_page.dart' as _i4;
import '../sign_in/sign_in_page.dart' as _i3;
import '../sign_up/sign_up_page.dart' as _i2;
import '../splash/splash_page.dart' as _i1;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.SignUpPage(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.SignInPage(),
      );
    },
    CreateShoppingListRoute.name: (routeData) {
      final args = routeData.argsAs<CreateShoppingListRouteArgs>(
          orElse: () => const CreateShoppingListRouteArgs());
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.CreateShoppingListPage(
          key: args.key,
          editedSession: args.editedSession,
        ),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i5.RouteConfig(
          SignUpRoute.name,
          path: '/sign-up-page',
        ),
        _i5.RouteConfig(
          SignInRoute.name,
          path: '/sign-in-page',
        ),
        _i5.RouteConfig(
          CreateShoppingListRoute.name,
          path: '/create-shopping-list-page',
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.SignUpPage]
class SignUpRoute extends _i5.PageRouteInfo<void> {
  const SignUpRoute()
      : super(
          SignUpRoute.name,
          path: '/sign-up-page',
        );

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i3.SignInPage]
class SignInRoute extends _i5.PageRouteInfo<void> {
  const SignInRoute()
      : super(
          SignInRoute.name,
          path: '/sign-in-page',
        );

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i4.CreateShoppingListPage]
class CreateShoppingListRoute
    extends _i5.PageRouteInfo<CreateShoppingListRouteArgs> {
  CreateShoppingListRoute({
    _i6.Key? key,
    _i7.Session? editedSession,
  }) : super(
          CreateShoppingListRoute.name,
          path: '/create-shopping-list-page',
          args: CreateShoppingListRouteArgs(
            key: key,
            editedSession: editedSession,
          ),
        );

  static const String name = 'CreateShoppingListRoute';
}

class CreateShoppingListRouteArgs {
  const CreateShoppingListRouteArgs({
    this.key,
    this.editedSession,
  });

  final _i6.Key? key;

  final _i7.Session? editedSession;

  @override
  String toString() {
    return 'CreateShoppingListRouteArgs{key: $key, editedSession: $editedSession}';
  }
}
