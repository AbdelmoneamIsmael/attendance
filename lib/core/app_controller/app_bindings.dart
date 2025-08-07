import 'package:attendance/core/app_controller/app_controller.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppController(), fenix: true);
  }
}
