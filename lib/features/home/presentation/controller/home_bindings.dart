import 'package:attendance/features/home/presentation/controller/home_controller.dart';
import 'package:attendance/features/home/presentation/controller/notifcation_stream_controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut(() => NotifcationStreamController());
  }
}
