// import 'dart:html' as web;
import 'package:attendance/app_configration.dart';
import 'package:attendance/core/repo/employees_repo/data/employee_repo_remote_data.dart';
import 'package:attendance/core/repo/employees_repo/repo/employee_repo.dart';
import 'package:attendance/core/repo/employees_repo/repo/get_employee_repo_imple.dart';
import 'package:attendance/core/util/cache/cache_helper.dart';
import 'package:attendance/core/util/functions/initialize_localization.dart';
import 'package:attendance/core/util/networking/api_server.dart';
import 'package:attendance/core/util/notification/notification_handeler.dart';
import 'package:attendance/features/login_screen/data/datasources/remote_login_data_source.dart';
import 'package:attendance/features/login_screen/data/repositories/login_services_imple.dart';
import 'package:attendance/features/login_screen/domain/repositories/login_services.dart';
import 'package:attendance/firebase_options.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  AppLocalization.language = await AppLocalization.init();
  await initialize();
  await firebaseConfig();
  runApp(
    DevicePreview(enabled: false, builder: (context) => const Attendance()),
  );
}

Future<void> firebaseConfig() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  var notificationPermission = await FirebaseMessaging.instance
      .getNotificationSettings();

  if (notificationPermission.authorizationStatus ==
      AuthorizationStatus.authorized) {
    await NotificationHelper.init();
  }
}

initialize() async {
  await CacheHelper.init();
  Get.lazyPut<LoginServices>(
    () => LoginServicesImple(
      remoteLoginDataSource: RemoteLoginDataSourceImple(ApiServer().dio),
    ),
  );
  Get.lazyPut<EmployeeRepo>(
    () => GetEmployeeRepoImple(
      employeeRepoRemoteData: EmployeeRepoRemoteDataImple(ApiServer().dio),
    ),
  );
}
