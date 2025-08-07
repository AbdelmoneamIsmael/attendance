import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CatigoryIcon extends StatelessWidget {
  const CatigoryIcon({
    super.key,
    required this.iconPath,
    this.isSelected = false,
    this.onTap,
  });
  final String iconPath;
  final bool isSelected;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(10),
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? Theme.of(context).primaryColor : Colors.white,
        ),
        child: SvgPicture.asset(
          iconPath,
          width: 32.w,
          fit: BoxFit.scaleDown,
          colorFilter: ColorFilter.mode(
            isSelected ? Colors.white : Theme.of(context).primaryColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
