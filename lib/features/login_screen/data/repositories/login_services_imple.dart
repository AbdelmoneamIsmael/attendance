import 'package:attendance/core/const/app_const.dart';
import 'package:attendance/core/models/account_model/account_model.dart';
import 'package:attendance/core/models/account_model/employee_info.dart';
import 'package:attendance/core/models/device_model/connected_device_model.dart';
import 'package:attendance/features/login_screen/domain/repositories/login_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:get/get.dart';

class LoginServicesImple extends LoginServices {
  var firestore = FirebaseFirestore.instance;
  
  @override
  Future<ConnectedDeviceModel> getConnectedDeviceModel({
    required String deviceId,
  }) async {
    try {
      var data = await firestore
          .collection(FireBaseTabels.connectedDevices)
          .doc(deviceId)
          .get();
      if (data.exists) {
        var connectedDeviceModel = ConnectedDeviceModel.fromJson(data.data()!);
        return connectedDeviceModel;
      } else {
        return ConnectedDeviceModel(deviceId: deviceId, employeeId: "");
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserAccountModel> getLoginAccountInfo({
    required String username,
    required String password,
  }) async {
    try {
      var data = await firestore
          .collection(FireBaseTabels.employees)
          .where("userName", isEqualTo: username)
          .where("password", isEqualTo: password)
          .get();
      if (data.docs.isNotEmpty) {
        var userAccountModel = UserAccountModel.fromJson(
          data.docs.first.data(),
        );
        return userAccountModel;
      } else {
        throw Exception("invaled_username_or_password".tr);
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<EmployeeInformation> login({required UserAccountModel account}) async {
    try {
      ConnectedDeviceModel connectedDeviceModel = await getConnectedDeviceModel(
        deviceId: account.mobileId!,
      );
      print(connectedDeviceModel.toJson());
      UserAccountModel userAccountModel = await getLoginAccountInfo(
        username: account.userName!,
        password: account.password!,
      );
      print(userAccountModel.toJson());
      if (userAccountModel.employeeId == connectedDeviceModel.employeeId) {
        //get employee info
        userAccountModel.lastActivity = Timestamp.now();
        await firestore
            .collection(FireBaseTabels.employees)
            .doc(userAccountModel.employeeId)
            .update(userAccountModel.toJson());
        return await getEmployeeInfo(employeeId: userAccountModel.employeeId!);
      } else if (userAccountModel.mobileId!.isEmpty) {
        //clear all logins devices
        var allDevicesWithThisUser = await firestore
            .collection(FireBaseTabels.connectedDevices)
            .where("employeeId", isEqualTo: userAccountModel.employeeId)
            .get();
        for (var elemt in allDevicesWithThisUser.docs) {
          await firestore
              .collection(FireBaseTabels.connectedDevices)
              .doc(elemt.id)
              .update({"employeeId": ""});
        }
        connectedDeviceModel.employeeId = userAccountModel.employeeId;
        connectedDeviceModel.deviceId = account.mobileId;
        userAccountModel.mobileId = account.mobileId;
        userAccountModel.mobileModle = account.mobileModle;
        userAccountModel.lastActivity = Timestamp.now();

        // asign device to user
        await firestore
            .collection(FireBaseTabels.employees)
            .doc(userAccountModel.employeeId)
            .set(userAccountModel.toJson());
        //asign user to device

        await firestore
            .collection(FireBaseTabels.connectedDevices)
            .doc(connectedDeviceModel.deviceId)
            .set(connectedDeviceModel.toJson(), SetOptions(merge: true));
        //get employee info
        return await getEmployeeInfo(employeeId: userAccountModel.employeeId!);
      } else if (userAccountModel.employeeId !=
          connectedDeviceModel.employeeId) {
        throw Exception("cant_Access_this_account".tr);
      } else {
        throw Exception("user_not_found".tr);
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<EmployeeInformation> getEmployeeInfo({
    required String employeeId,
  }) async {
    try {
      var data = await firestore
          .collection(FireBaseTabels.employeeInfo)
          .doc(employeeId)
          .get();
      var employeeInfo = EmployeeInformation.fromJson(data.data()!);
      return employeeInfo;
    } catch (e) {
      rethrow;
    }
  }
}
