import 'dart:io';

import 'package:attendance/core/models/account_model/account_model.dart';
import 'package:attendance/core/models/account_model/employee_info.dart';
import 'package:attendance/core/routes/pages_keys.dart';
import 'package:attendance/core/util/networking/firebase_connection.dart';
import 'package:attendance/core/widgets/ui_helper.dart';
import 'package:attendance/features/login_screen/domain/repositories/login_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:unique_identifier/unique_identifier.dart';

class LoginController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FireBaseHelper fireBaseHelper = FireBaseHelper.getInstance();
  LoginServices loginServices = Get.find<LoginServices>();
  String? _deviceId;
  bool securePass = true;
  final auth = LocalAuthentication();
  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Future<void> onInit() async {
    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    final bool canAuthenticate =
        canAuthenticateWithBiometrics || await auth.isDeviceSupported();
    super.onInit();
  }

  void changeScure() {
    securePass = !securePass;
    update();
  }

  bool loading = false;
  Future<void> login() async {
    await checkFaceAuth();
    String identifier = await getDeviceId() ?? "";
    String mobileModle = await getDeviceInfo();
    if (formKey.currentState!.validate()) {
      bool auth = await authenticateUser();

      if (auth) {
        loading = true;
        update();
        UserAccountModel account = UserAccountModel(
          employeeId: "",
          userName: usernameController.text,
          password: passwordController.text,
          mobileModle: mobileModle,
          mobileId: identifier,
          lastActivity: Timestamp.now(),
        );
        try {
          EmployeeInformation employeeInformation = await loginServices.login(
            account: account,
          );
          Get.toNamed(PageKeys.homeScreen, arguments: employeeInformation);
          loading = false;
          update();
        } on Exception catch (e) {
          loading = false;
          update();
          UIHelper.showSnakBar(title: "Error", message: e.toString());
        }
      }
    }
  }

  Future<bool> authenticateUser() async {
    return true; //for semulator
    // try {
    //   // Check if device supports biometrics (face/fingerprint)
    //   final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    //   bool canAuthenticate =
    //       await auth.canCheckBiometrics || await auth.isDeviceSupported();

    //   if (!canAuthenticate) {
    //     UIHelper.showSnakBar(
    //       title: "Error",
    //       message: "Your device is not supported for biometric authentication",
    //     );

    //     return false;
    //   }

    //   // Get available biometrics (face, fingerprint...)
    //   List<BiometricType> availableBiometrics = await auth
    //       .getAvailableBiometrics();

    //   print("Available biometrics: $availableBiometrics");

    //   // Authenticate the user
    //   bool didAuthenticate = await auth.authenticate(
    //     localizedReason: 'Please authenticate to access the app',
    //     options: const AuthenticationOptions(
    //       biometricOnly: true,
    //       stickyAuth: true,
    //     ),
    //   );

    //   if (didAuthenticate) {
    //     UIHelper.showSnakBar(
    //       title: "Success",
    //       message: "Authentication successful",
    //     );
    //     // Proceed: Save auth status to database or allow access
    //     return true;
    //   } else {
    //     UIHelper.showSnakBar(title: "Error", message: "Authentication failed");
    //     return false;
    //   }
    // } catch (e) {
    //   UIHelper.showSnakBar(
    //     title: "Error",
    //     message: "Authentication failed ${e.toString()}",
    //   );
    //   return false;
    // }
  }

  Future<String?> getDeviceId() async {
    String? identifier;
    try {
      identifier = await UniqueIdentifier.serial;
    } catch (e) {
      identifier = 'Failed to get device identifier';
    }

    _deviceId = identifier;
    print("Device ID: $_deviceId");
    return identifier;
    //Device ID: fa8ef9ee68041b8b
  }

  Future<String> getDeviceInfo() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfoPlugin.androidInfo;

      print('Device model: ${androidInfo.model}');
      return androidInfo.model;
    } else {
      final iosInfo = await deviceInfoPlugin.iosInfo;
      print('Device model: ${iosInfo.model}');
      return iosInfo.model;
    }
  }

  Future<void> checkFaceAuth() async {
    // Get list of available biometrics
    final available = await auth.getAvailableBiometrics();

    if (available.contains(BiometricType.face)) {
      print("Face authentication is available ✅");
    } else {
      print("Face authentication not available ❌");
    }
  }
}
