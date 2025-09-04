import 'package:attendance/core/models/account_model/employee_info.dart';
import 'package:attendance/core/models/account_model/user_info_model.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  late UserInfoModel userInfoModel;
  late EmployeeInformation employeeInformation;
  void initializeUserInfo(UserInfoModel userInfoModel) {
    this.userInfoModel = userInfoModel;
    update();
  }

  void initializeEmployeeInfo(EmployeeInformation employeeInformation) {
    this.employeeInformation = employeeInformation;
    update();
  }

  void logout() {
    update();
  }
}
