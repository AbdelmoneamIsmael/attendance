import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:attendance/core/app_controller/app_bindings.dart';
import 'package:attendance/core/app_controller/app_controller.dart';
import 'package:attendance/core/app_controller/language_controller.dart';
import 'package:attendance/core/const/app_const.dart';
import 'package:attendance/core/routes/pages_keys.dart';
import 'package:attendance/core/util/functions/initialize_Localization.dart';
import 'package:flutter/material.dart';
import 'package:attendance/core/routes/page_routes.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ApplicationDesign extends StatelessWidget {
  const ApplicationDesign({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      init: AppController(),
      builder: (controller) {
        return ThemeProvider(
          duration: const Duration(milliseconds: 1000),
          initTheme: controller.getTheme(),
          builder: (context, theme) {
            return GetBuilder<LocalizationController>(
              builder: (localizationController) {
                return GetMaterialApp(
                  title: kAppName,
                  locale: localizationController.locale,
                  translations: Messages(languages: AppLocalization.language),
                  fallbackLocale: Locale(
                    AppConstants.languages[0].languageCode,
                    AppConstants.languages[0].countryCode,
                  ),
                  initialBinding: AppBindings(),
                  getPages: AppPages.routes,
                  initialRoute: kInitialRoute,
                  builder: (context, child) {
                    return child!;
                  },
                  debugShowCheckedModeBanner: false,
                  theme: theme,
                );
              },
            );
          },
        );
      },
    );
  }
}
