import 'package:attendance/core/controllers/auth_controller/auth_controller.dart';
import 'package:attendance/core/models/account_model/employee_info.dart';
import 'package:get/get.dart';
import 'package:unique_identifier/unique_identifier.dart';

class HomeController extends GetxController {
  late EmployeeInformation employeeInformation;
  @override
  void onInit() {
    employeeInformation = Get.find<AuthController>().employeeInformation!;
    super.onInit();
  }
}
