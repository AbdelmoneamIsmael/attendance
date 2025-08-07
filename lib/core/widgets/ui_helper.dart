import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:attendance/core/themes/colors/colors.dart';
import 'package:attendance/core/themes/styles/app_text_style.dart';

class UIHelper {
  static BoxShadow shadow() {
    return BoxShadow(
      color: Colors.black.withAlpha((0.5 * 255).round()),
      spreadRadius: -5,
      blurRadius: 10,
      offset: const Offset(0, 0),
    );
  }

  static void showSnakBar({
    String? title,
    required String message,
    Color? backgroundColor,
    Color? colorText,
    Function? onTap,
  }) {
    Get.snackbar(
      duration: const Duration(seconds: 3),
      title ?? "",
      message,
      backgroundColor:
          backgroundColor ??
          Theme.of(Get.context!).primaryColor.withValues(alpha: .5),
      margin: const EdgeInsets.all(10),
      colorText: colorText,
      onTap: (value) => onTap!(),
      titleText: MediaQuery(
        data: MediaQuery.of(
          Get.context!,
        ).copyWith(textScaler: const TextScaler.linear(1)),
        child: Text(title ?? "", textAlign: TextAlign.center),
      ),
      messageText: MediaQuery(
        data: MediaQuery.of(
          Get.context!,
        ).copyWith(textScaler: const TextScaler.linear(1)),
        child: Text(message, textAlign: TextAlign.center),
      ),
    );
  }

  static void showBackDialog({
    required String message,
    required String title,
    required void Function()? onPressed,
    required BuildContext context,
  }) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(
          title,
          style: AppTextStyles.bold(context).copyWith(fontSize: 16.sp),
        ),
        content: Text(message, style: AppTextStyles.medium(context)),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            child: Text(
              "cancel".tr,
              style: AppTextStyles.regular(
                context,
              ).copyWith(color: LightColors.redColor),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          CupertinoDialogAction(
            onPressed: () async {
              dynamic pressaction;
              if (onPressed != null) pressaction = onPressed;
              pressaction();
              Navigator.of(context).pop();
            },

            child: Text("i_am_sure".tr, style: AppTextStyles.semiBold(context)),
          ),
        ],
      ),
    );
  }
}

class PrinterHelper {
  PrinterHelper(this.title) {
    log(title);
  }
  final String title;
}
