import 'package:attendance/features/all_attendance_calender/presentation/controller/all_attendance_calender_controller.dart';
import 'package:get/get.dart';

class AttendanceBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<AttendCalenderController>(() => AttendCalenderController());
  }
}