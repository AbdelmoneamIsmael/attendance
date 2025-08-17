import 'package:attendance/features/notification/presentation/controller/notification_controller.dart';
import 'package:get/get.dart';

class NotificationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationController>(() => NotificationController());
  }
}
