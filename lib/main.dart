// import 'dart:html' as web;
import 'package:attendance/app_configration.dart';
import 'package:attendance/core/util/functions/initialize_Localization.dart';
import 'package:attendance/features/login_screen/data/repositories/login_services_imple.dart';
import 'package:attendance/features/login_screen/domain/repositories/login_services.dart';
import 'package:attendance/firebase_options.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  AppLocalization.language = await AppLocalization.init();
  initialize();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    DevicePreview(enabled: false, builder: (context) => const Attendance()),
  );
}

initialize() {
  Get.lazyPut<LoginServices>(() => LoginServicesImple());
}
