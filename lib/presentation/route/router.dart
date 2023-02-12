import 'package:auto_route/annotations.dart';
import 'package:grocery_app/presentation/session/create_shopping_list/create_shopping_list_page.dart';

import '../sign_in/sign_in_page.dart';
import '../sign_up/sign_up_page.dart';
import '../splash/splash_page.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: <AutoRoute>[
  MaterialRoute(page: SplashPage, initial: true),
  MaterialRoute(page: SignUpPage),
  MaterialRoute(page: SignInPage),
  MaterialRoute(page: CreateShoppingListPage),
])
class $AppRouter {}
