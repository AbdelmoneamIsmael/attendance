import 'dart:io';

import 'package:attendance/core/const/app_const.dart';
import 'package:attendance/core/const/storage_keys.dart';
import 'package:attendance/core/controllers/auth_controller/auth_controller.dart';
import 'package:attendance/core/models/account_model/user_info_model.dart';
import 'package:attendance/core/routes/pages_keys.dart';
import 'package:attendance/core/util/cache/cache_helper.dart';
import 'package:attendance/core/util/networking/firebase_connection.dart';
import 'package:attendance/core/util/notification/notification_handeler.dart';
import 'package:attendance/core/widgets/ui_helper.dart';
import 'package:attendance/features/login_screen/domain/entities/login_params.dart';
import 'package:attendance/features/login_screen/domain/repositories/login_services.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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
    // await checkFaceAuth();
    await cheeckNotification();
    String identifier = await getDeviceId() ?? "";
    String mobileModle = await getDeviceInfo();
    if (formKey.currentState!.validate()) {
      bool auth = await authenticateUser();

      if (true) {
        loading = true;
        update();
        LoginParams loginParams = LoginParams(
          username: usernameController.text,
          password: passwordController.text,
          deviceToken: kDeviceToken,
          deviceId: identifier,
          longitude: "0",
          latitude: "1",
        );
        try {
          var results = await loginServices.login(loginParams: loginParams);
          results.fold(
            (l) => UIHelper.showSnakBar(title: "Error", message: l.message),
            (r) async {
              await CacheHelper.setSecuerString(
                key: StorageKeys.accessToken,
                value: r.token ?? "",
              );
              Get.find<AuthController>().initializeUserInfo(r);
              await getEmployeeInfo(user: r);
            },
          );

          loading = false;
          update();

          // Get.toNamed(PageKeys.homeScreen, arguments: employeeInformation);
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

  Future<void> cheeckNotification() async {
    var notificationPermission = await FirebaseMessaging.instance
        .getNotificationSettings();

    if (notificationPermission.authorizationStatus !=
        AuthorizationStatus.authorized) {
      await NotificationHelper.init();
    }
  }

  Future<void> getEmployeeInfo({required UserInfoModel user}) async {
    var result = await loginServices.getLoginEmployeeInfo(userID: user.id ?? 0);

    result.fold(
      (l) => UIHelper.showSnakBar(title: "Error", message: l.message),
      (r) async {
        Get.find<AuthController>().initializeEmployeeInfo(r);
        Get.offAndToNamed(PageKeys.homeScreen);
      },
    );
  }
}
