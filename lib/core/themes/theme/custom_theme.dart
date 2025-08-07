import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:attendance/core/const/app_const.dart';
import 'package:attendance/core/themes/colors/colors.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: kFontFamily,
  brightness: Brightness.light,
  scaffoldBackgroundColor: LightColors.backgroundColor,
  primaryColor: LightColors.primaryColor,
  useMaterial3: true,
  colorScheme: const ColorScheme.light().copyWith(
    primaryFixed: LightColors.themeColor,
    primaryContainer: LightColors.containerColor,
    secondaryContainer: LightColors.secondContainerColor,
  ),
  textTheme: const TextTheme(
    ///for normal text
    bodyMedium: TextStyle(
      fontFamily: kFontFamily,
      color: LightColors.textColor,
    ),

    ///for normal hint text
    bodySmall: TextStyle(
      fontFamily: kFontFamily,
      color: LightColors.text2Color,
    ),
  ),
  iconTheme: const IconThemeData(color: LightColors.textColor),
  appBarTheme: AppBarTheme(
    centerTitle: false,
    elevation: 0,
    scrolledUnderElevation: 0,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: LightColors.backgroundColor,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
    backgroundColor: LightColors.backgroundColor,
    titleTextStyle: TextStyle(
      color: LightColors.textColor,
      fontFamily: kFontFamily,
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
    ),
    iconTheme: const IconThemeData(color: LightColors.primaryColor),
  ),
  tabBarTheme: TabBarThemeData(
    indicatorColor: LightColors.primaryColor,
    indicatorSize: TabBarIndicatorSize.label,
    unselectedLabelStyle: TextStyle(
      color: LightColors.textColor,
      fontFamily: kFontFamily,
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
    ),
    labelStyle: TextStyle(
      color: LightColors.primaryColor,
      fontFamily: kFontFamily,
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
    ),
    dividerColor: LightColors.greyColor,
    labelPadding: EdgeInsets.symmetric(vertical: 8.h),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    prefixIconColor: LightColors.greyColor,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(7.r),
      borderSide: const BorderSide(width: 1, color: LightColors.greyColor),
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(7.r),
      borderSide: const BorderSide(width: 1, color: LightColors.greyColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(7.r),
      borderSide: const BorderSide(width: 1, color: LightColors.primaryColor),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(7.r),
      borderSide: const BorderSide(width: 1, color: LightColors.greyColor),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(7.r),
      borderSide: const BorderSide(width: 1, color: LightColors.redColor),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(7.r),
      borderSide: const BorderSide(width: 1, color: LightColors.redColor),
    ),
    hintStyle: TextStyle(
      fontFamily: kFontFamily,
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: LightColors.greyColor,
    ),
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith(
      (states) => states.contains(WidgetState.selected)
          ? LightColors.primaryColor
          : LightColors.backgroundColor,
    ),
    checkColor: WidgetStateProperty.resolveWith(
      (states) => states.contains(WidgetState.selected)
          ? LightColors.backgroundColor
          : LightColors.primaryColor,
    ),
    side: BorderSide(width: 2.w, color: LightColors.darkGreyColor),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.r)),
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: LightColors.backgroundColor,
    showDragHandle: true,
    constraints: const BoxConstraints(maxWidth: double.infinity),

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.r),
        topRight: Radius.circular(20.r),
      ),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: LightColors.buttonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
        side: const BorderSide(color: LightColors.buttonColor),
      ),
      textStyle: TextStyle(
        fontFamily: kFontFamily,
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        color: LightColors.backgroundColor,
      ),
      fixedSize: Size(double.maxFinite, 40.h),
      foregroundColor: Colors.white,
    ),
  ),
  dividerColor: DarkColors.greyColor,
);

///
///
///dark theme
///
///
///
ThemeData darkTheme = ThemeData(
  fontFamily: kFontFamily,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: DarkColors.backgroundColor,
  bottomAppBarTheme: const BottomAppBarTheme(),
  iconTheme: const IconThemeData(color: DarkColors.textColor),
  primaryColor: DarkColors.primaryColor,
  useMaterial3: true,
  colorScheme: const ColorScheme.dark().copyWith(
    primaryContainer: DarkColors.containerColor,
    primaryFixed: DarkColors.themeColor,
    secondaryContainer: DarkColors.secondContainerColor,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(fontFamily: kFontFamily, color: DarkColors.textColor),
    bodySmall: TextStyle(fontFamily: kFontFamily, color: DarkColors.text2Color),
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith(
      (states) => states.contains(WidgetState.selected)
          ? DarkColors.primaryColor
          : DarkColors.backgroundColor,
    ),
    checkColor: WidgetStateProperty.resolveWith(
      (states) => states.contains(WidgetState.selected)
          ? DarkColors.backgroundColor
          : DarkColors.primaryColor,
    ),
    side: BorderSide(width: 2.w, color: DarkColors.darkGreyColor),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.r)),
  ),
  appBarTheme: AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: false,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: DarkColors.backgroundColor,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
    backgroundColor: DarkColors.backgroundColor,
    titleTextStyle: TextStyle(
      fontFamily: kFontFamily,
      color: DarkColors.textColor,
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
    ),
    iconTheme: const IconThemeData(color: DarkColors.primaryColor),
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 16.5.h),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(7.r),
      borderSide: const BorderSide(width: 1, color: DarkColors.darkGreyColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(7.r),
      borderSide: const BorderSide(width: 1, color: DarkColors.primaryColor),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(7.r),
      borderSide: const BorderSide(width: 1, color: DarkColors.darkGreyColor),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(7.r),
      borderSide: const BorderSide(width: 1, color: DarkColors.redColor),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(7.r),
      borderSide: const BorderSide(width: 1, color: DarkColors.redColor),
    ),
    hintStyle: TextStyle(
      fontFamily: kFontFamily,
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: DarkColors.text2Color,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(7.r),
      borderSide: const BorderSide(width: 1, color: DarkColors.darkGreyColor),
    ),
  ),
  dividerColor: DarkColors.greyColor,
  tabBarTheme: TabBarThemeData(
    indicatorColor: DarkColors.primaryColor,
    indicatorSize: TabBarIndicatorSize.label,
    unselectedLabelStyle: TextStyle(
      color: DarkColors.textColor,
      fontFamily: kFontFamily,
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
    ),
    labelStyle: TextStyle(
      color: DarkColors.primaryColor,
      fontFamily: kFontFamily,
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
    ),
    dividerColor: DarkColors.greyColor,
    labelPadding: EdgeInsets.symmetric(vertical: 8.h),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: DarkColors.buttonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(29.r),
        side: const BorderSide(color: DarkColors.buttonColor),
      ),
      textStyle: TextStyle(
        fontFamily: kFontFamily,
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        color: DarkColors.textColor,
      ),
      fixedSize: Size(double.maxFinite, 45.h),
      foregroundColor: Colors.white,
    ),
  ),
);
