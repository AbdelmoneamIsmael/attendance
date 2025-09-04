import 'package:attendance/core/controllers/auth_controller/auth_controller.dart';
import 'package:get/get.dart';

class AuthBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
