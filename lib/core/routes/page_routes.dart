import 'package:attendance/core/routes/pages_keys.dart';
import 'package:attendance/features/login_screen/presentation/pages/login_screen.dart';
import 'package:get/get.dart';


class AppPages {
  AppPages._();
  static const initial = Routes.loginScreen;


  static final routes = [
    GetPage(
      name: Routes.loginScreen,
      
      page: () => const LoginScreen(),
      // binding: RegisterBinding(),
      transition: Transition.cupertino,
    ),
   
  ];
}
