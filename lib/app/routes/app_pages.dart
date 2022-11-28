import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/sign_in/bindings/sign_in_binding.dart';
import '../modules/sign_in/views/sign_in_view.dart';
import '../modules/sign_in/with_password/bindings/with_password_binding.dart';
import '../modules/sign_in/with_password/views/with_password_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      transition: Transition.fadeIn,
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => const SignInView(),
      binding: SignInBinding(),
      transition: Transition.fadeIn,
      children: [
        GetPage(
          transition: Transition.downToUp,
          transitionDuration: const Duration(milliseconds: 800),
          name: _Paths.WITH_PASSWORD,
          page: () => const WithPasswordView(),
          binding: WithPasswordBinding(),
        ),
      ],
    ),
  ];
}
