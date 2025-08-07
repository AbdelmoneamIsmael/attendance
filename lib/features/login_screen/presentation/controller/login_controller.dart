import 'dart:io';

import 'package:attendance/core/routes/pages_keys.dart';
import 'package:attendance/core/widgets/ui_helper.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:unique_identifier/unique_identifier.dart';

class LoginController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? _deviceId;
  bool securePass = true;
  final auth = LocalAuthentication();
  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void changeScure() {
    securePass = !securePass;
    update();
  }

  Future<void> login() async {
    getDeviceId();
    getDeviceInfo();
    // if (formKey.currentState!.validate()) {
    //   bool auth = await authenticateUser();
    //   if (auth) {
    //     Get.toNamed(PageKeys.homeScreen);
    //   }
    // }
  }

  Future<bool> authenticateUser() async {
    try {
      // Check if device supports biometrics (face/fingerprint)
      bool canAuthenticate =
          await auth.canCheckBiometrics || await auth.isDeviceSupported();

      if (!canAuthenticate) {
        UIHelper.showSnakBar(
          title: "Error",
          message: "Your device is not supported for biometric authentication",
        );

        return false;
      }

      // Get available biometrics (face, fingerprint...)
      List<BiometricType> availableBiometrics = await auth
          .getAvailableBiometrics();

      print("Available biometrics: $availableBiometrics");

      // Authenticate the user
      bool didAuthenticate = await auth.authenticate(
        localizedReason: 'Please authenticate to access the app',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );

      if (didAuthenticate) {
        UIHelper.showSnakBar(
          title: "Success",
          message: "Authentication successful",
        );
        // Proceed: Save auth status to database or allow access
        return true;
      } else {
        UIHelper.showSnakBar(title: "Error", message: "Authentication failed");
        return false;
      }
    } catch (e) {
      UIHelper.showSnakBar(
        title: "Error",
        message: "Authentication failed ${e.toString()}",
      );
      return false;
    }
  }

  Future<void> getDeviceId() async {
    String? identifier;
    try {
      identifier = await UniqueIdentifier.serial;
    } catch (e) {
      identifier = 'Failed to get device identifier';
    }

    _deviceId = identifier;
    print("Device ID: $_deviceId");
    //Device ID: fa8ef9ee68041b8b
  }

  Future<void> getDeviceInfo() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfoPlugin.androidInfo;
      final displayInfo = await deviceInfoPlugin.androidInfo;
      print('Device model: ${androidInfo.model}');
    } else {
      final iosInfo = await deviceInfoPlugin.iosInfo;
      print('Device model: ${iosInfo.model}');
    }
  }
}
