import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:attendance/core/layout/app_core_design.dart';

class TabletLayOut extends StatelessWidget {
  const TabletLayOut({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1024, 1769),

      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return const ApplicationDesign();
      },
    );
  }
}
