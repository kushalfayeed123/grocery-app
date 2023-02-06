import 'package:auto_route/annotations.dart';

import '../sign_in/sign_in_page.dart';
import '../sign_up/sign_up_page.dart';
import '../splash/splash_page.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: <AutoRoute>[
  MaterialRoute(page: SplashPage, initial: true),
  MaterialRoute(page: SignUpPage),
  MaterialRoute(page: SignInPage),
])
class $AppRouter {}
