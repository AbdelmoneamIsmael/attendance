import 'package:attendance/core/routes/pages_keys.dart';
import 'package:attendance/core/widgets/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

class LoginController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
    if (formKey.currentState!.validate()) {
      bool auth = await authenticateUser();
      if (auth) {
        Get.toNamed(PageKeys.homeScreen);
      }
    }
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
}
