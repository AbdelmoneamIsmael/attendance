import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:attendance/core/layout/app_core_design.dart';

class WebLayOut extends StatelessWidget {
  const WebLayOut({super.key});
  
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1920, 1152),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return const ApplicationDesign();
      },
    );
  }
}
