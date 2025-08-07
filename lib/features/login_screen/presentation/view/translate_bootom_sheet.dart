import 'package:attendance/core/app_controller/language_controller.dart';
import 'package:attendance/core/const/app_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TranslateBootomSheet extends StatelessWidget {
  const TranslateBootomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(
      builder: (controller) {
        return Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Text(AppConstants.languages[0].imageUrl),
                title: Text("english".tr),
                onTap: () {
                  controller.setLanguage(
                    Locale(
                      AppConstants.languages[0].languageCode,
                      AppConstants.languages[0].countryCode,
                    ),
                  );
                  controller.setSelectedIndex(0);
                  Get.back();
                },
              ),
              ListTile(
                leading: Text(AppConstants.languages[1].imageUrl),
                title: Text("arabic".tr),
                onTap: () {
                  controller.setLanguage(
                    Locale(
                      AppConstants.languages[1].languageCode,
                      AppConstants.languages[1].countryCode,
                    ),
                  );
                  controller.setSelectedIndex(1);
                  Get.back();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
