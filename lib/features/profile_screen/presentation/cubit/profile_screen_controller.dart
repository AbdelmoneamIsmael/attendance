import 'package:get/get.dart';

class ProfileController extends GetxController {
    int employeeId = 0;
    @override
  void onInit() {
    String employeeID = Get.parameters["employeeID"] ?? "0";
    employeeId = int.parse(employeeID);
    super.onInit();
  }
}
