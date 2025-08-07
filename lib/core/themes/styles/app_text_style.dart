import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppTextStyles {
  ///regular
  static TextStyle regular(BuildContext context) => TextStyle(
    fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: Theme.of(context).textTheme.bodyMedium!.color,
    height: 1,
  );

  ///medium
  static TextStyle medium(BuildContext context) => TextStyle(
    fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
    fontSize: 14.sp,
    height: 1,
    fontWeight: FontWeight.w500,
    color: Theme.of(context).textTheme.bodyMedium!.color,
  );
  static TextStyle mediumLine(BuildContext context) => TextStyle(
    fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    decoration: TextDecoration.underline,
    decorationColor: Colors.white,
    decorationThickness: 10,
  );

  ///medium
  static TextStyle semiBold(BuildContext context) => TextStyle(
    fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
    fontSize: 14.sp,
    height: 1,
    fontWeight: FontWeight.w600,
    color: Theme.of(context).textTheme.bodyMedium!.color,
  );

  ///bold
  static TextStyle bold(BuildContext context) => TextStyle(
    fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
    fontSize: 16.sp,
    height: 1,
    fontWeight: FontWeight.w700,
    color: Theme.of(context).textTheme.bodyMedium!.color,
  );
  //appStyles
  static TextStyle inUseLable(BuildContext context) => TextStyle(
    fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: Theme.of(context).textTheme.bodyMedium!.color,
  );
  static TextStyle lablell(BuildContext context) => TextStyle(
    fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: Theme.of(context).textTheme.bodyMedium!.color,
  );
  static TextStyle buttons(BuildContext context) => TextStyle(
    fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    height: 1.38,
    color: Theme.of(context).textTheme.bodyMedium!.color,
  );
  static TextStyle lable2(BuildContext context) => TextStyle(
    fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    color: Theme.of(context).textTheme.bodyMedium!.color,
  );
}
