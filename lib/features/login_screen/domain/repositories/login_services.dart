import 'package:attendance/core/models/account_model/account_model.dart';
import 'package:attendance/core/models/account_model/employee_info.dart';
import 'package:attendance/core/models/device_model/connected_device_model.dart';

abstract class LoginServices {
  Future<UserAccountModel> getLoginAccountInfo({
    required String username,
    required String password,
  });
  Future<ConnectedDeviceModel> getConnectedDeviceModel({
    required String deviceId,
  });
  Future<EmployeeInformation> login({required UserAccountModel account});
  Future<EmployeeInformation> getEmployeeInfo({required String employeeId});
}
