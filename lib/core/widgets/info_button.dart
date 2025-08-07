import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:attendance/core/themes/styles/app_text_style.dart';

class InfoButton extends StatelessWidget {
  const InfoButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.color,
    this.borderColor,
    this.textColor,

    this.padding,
  });
  final String text;
  final VoidCallback onTap;
  final Color color;
  final Color? borderColor, textColor;
  final EdgeInsetsDirectional? padding;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,

      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: borderColor ?? color),
        ),
        child: Padding(
          padding:
              padding ??
              const EdgeInsets.symmetric(vertical: 10, horizontal: 20).w,
          child: Text(
            text,
            style: AppTextStyles.medium(
              context,
            ).copyWith(color: textColor ?? Colors.white),
          ),
        ),
      ),
    );
  }
}
