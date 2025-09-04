import 'package:attendance/core/controllers/app_controller/app_controller.dart';
import 'package:attendance/core/controllers/auth_controller/auth_controller.dart';
import 'package:attendance/core/layout/mobile_layout_screen/mobile_layout_screen.dart';
import 'package:attendance/core/layout/select_layout_screen.dart';
import 'package:attendance/core/layout/tablet_layout_screen/tablet_layout_screen.dart.dart';
import 'package:attendance/core/layout/web_layout_screen/web_layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Attendance extends StatelessWidget {
  const Attendance({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
    );

    return GetBuilder<AppController>(
      init: AppController(),
      builder: (appController) {
        return GetBuilder<AuthController>(
          init: AuthController(),
          builder: (authController) {
            return SelectLayoutSCreen(
              mobileBuilder: (context) => const MobileLayOut(),
              tabletBuilder: (context) => const TabletLayOut(),
              webBuilder: (context) => const WebLayOut(),
            );
          },
        );
      },
    );
  }
}
