import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:attendance/core/themes/styles/app_text_style.dart';

class TitleTale extends StatelessWidget {
  const TitleTale({super.key, required this.title, this.trailing, this.onTap});
  final String title;
  final String? trailing;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(title, style: AppTextStyles.semiBold(context)),
      trailing: trailing == null
          ? null
          : Text(
              trailing!,
              style: AppTextStyles.semiBold(
                context,
              ).copyWith(color: Theme.of(context).primaryColor, fontSize: 10.h),
            ),
    );
  }
}
