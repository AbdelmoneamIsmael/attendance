import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:attendance/core/themes/styles/app_text_style.dart';

class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({
    super.key,
    required this.options,
    this.bottom,
    this.title,
  });
  final List<AppBottomSheetOption> options;
  final String? title;
  final Widget? bottom;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottom,
      appBar: AppBar(centerTitle: true, title: Text(title ?? "")),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(22).w,

          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryFixed,
            borderRadius: BorderRadius.all(Radius.circular(20.r)),
          ),
          child: Column(children: options),
        ),
      ),
    );
  }
}

class AppBottomSheetOption extends StatelessWidget {
  const AppBottomSheetOption({
    this.enableTrailing = false,
    super.key,
    required this.title,
    this.leading,
    this.onTap,
    required this.icon,
    this.forgroundColor,
  });
  final String title, icon;
  final Widget? leading;
  final VoidCallback? onTap;
  final bool enableTrailing;
  final Color? forgroundColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        onTap: onTap,
        tileColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(title),
        titleTextStyle: AppTextStyles.medium(
          context,
        ).copyWith(fontSize: 16.sp, color: forgroundColor),
        leading: Container(
          height: 40,
          width: 40,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Theme.of(context).textTheme.bodyMedium!.color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(
            icon,
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(
              forgroundColor ?? Theme.of(context).colorScheme.primaryFixed,
              BlendMode.srcIn,
            ),
          ),
        ),
        trailing: enableTrailing
            ? Icon(
                Icons.arrow_forward_ios,
                color: Theme.of(context).textTheme.bodyMedium!.color,
                size: 20.sp,
              )
            : null,
      ),
    );
  }
}
