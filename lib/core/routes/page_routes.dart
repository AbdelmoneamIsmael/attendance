import 'package:attendance/core/routes/pages_keys.dart';
import 'package:attendance/features/home/presentation/controller/home_state.dart';
import 'package:attendance/features/home/presentation/pages/home_screen.dart';
import 'package:attendance/features/login_screen/presentation/controller/login_bindings.dart';
import 'package:attendance/features/login_screen/presentation/pages/login_screen.dart';
import 'package:get/get.dart';

class AppPages {
  AppPages._();
  static const initial = PageKeys.loginScreen;

  static final routes = [
    GetPage(
      name: PageKeys.loginScreen,

      page: () => const LoginScreen(),
      binding: LoginBindings(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: PageKeys.homeScreen,

      page: () => const HomeScreen(),
      binding: HomeBinding(),
      transition: Transition.cupertino,
    ),
  ];
}
