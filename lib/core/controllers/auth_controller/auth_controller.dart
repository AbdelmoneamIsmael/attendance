import 'package:attendance/core/const/storage_keys.dart';
import 'package:attendance/core/models/account_model/employee_info.dart';
import 'package:attendance/core/models/account_model/user_info_model.dart';
import 'package:attendance/core/util/cache/cache_helper.dart';
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

  Future<void> logout() async {
    userInfoModel = UserInfoModel(
      message: "",
      isAuthenticated: false,
      id: 0,
      username: "",
      email: "",
      phoneNumber: "",
      deviceToken: "",
      imageUrl: "",
      token: "",
      expiresOn: DateTime.now(),
      refreshToken: "",
      refreshTokenExpiration: DateTime.now(),
      statusCode: 0,
    );
    employeeInformation = EmployeeInformation(
      employeeView: null,
      shiftView: null,
    );
    await CacheHelper.setSecuerString(key: StorageKeys.accessToken, value: "");
    await CacheHelper.setSecuerString(key: StorageKeys.refreshToken, value: "");

    update();
  }
}
