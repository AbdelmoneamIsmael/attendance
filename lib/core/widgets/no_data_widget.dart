import 'package:attendance/core/themes/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({
    super.key,
    required this.iconPath,
    required this.title,
    required this.description,
    this.color,
    this.svgIconColor,
    this.iconBgColor,
    this.height,
    this.width,
    this.fit,
  });
  final String iconPath, title, description;
  final Color? color, iconBgColor, svgIconColor;
  final double? height, width;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.sizeOf(context).width * 0.9,
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              height: height ?? 50,
              width: width ?? 50,
              padding: const EdgeInsets.all(14),
              child: SvgPicture.asset(
                iconPath,
                colorFilter: ColorFilter.mode(
                  svgIconColor ?? Colors.white,
                  BlendMode.srcIn,
                ),
                height: height ?? 12,
                width: width ?? 12,
                fit: fit ?? BoxFit.contain,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyles.semiBold(context),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: AppTextStyles.medium(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
