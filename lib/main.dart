// import 'dart:html' as web;
import 'package:attendance/app_configration.dart';
import 'package:attendance/core/util/functions/initialize_Localization.dart';
import 'package:device_preview/device_preview.dart';



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  AppLocalization.language= await AppLocalization.init();
  
 

  runApp(
    DevicePreview(enabled: false, builder: (context) => const Attendance()),
  );
}

