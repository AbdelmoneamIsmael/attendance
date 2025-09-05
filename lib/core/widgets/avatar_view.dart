import 'package:attendance/core/util/extentions/string_extintion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvatarView extends StatelessWidget {
  const AvatarView({super.key, required this.name, this.raduis});
  final String name;
  final double? raduis;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: raduis ?? 50.r,
      backgroundColor: Theme.of(context).primaryColor.withValues(alpha: .5),
      child: Text(
        name.getTwoLetters(),
        style: TextStyle(
          fontSize: raduis != null ? raduis! - 10 : 40.sp,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
