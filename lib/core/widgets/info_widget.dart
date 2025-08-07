import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:attendance/core/themes/styles/app_text_style.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });
  final String title, icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        onTap: onTap,
        tileColor: Theme.of(context).colorScheme.primaryFixed,
        contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(title),
        titleTextStyle: AppTextStyles.regular(
          context,
        ).copyWith(fontSize: 16.sp),
        leading: Container(
          height: 40.h,
          width: 40.w,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Theme.of(context).textTheme.bodyMedium!.color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(
            icon,
            colorFilter: ColorFilter.mode(
              Theme.of(context).scaffoldBackgroundColor,
              BlendMode.srcIn,
            ),
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Theme.of(context).textTheme.bodyMedium!.color,
          size: 20.sp,
        ),
      ),
    );
  }
}
