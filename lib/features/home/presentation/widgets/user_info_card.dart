import 'dart:async';
import 'package:attendance/core/models/account_model/employee_info.dart';
import 'package:attendance/core/themes/colors/colors.dart';
import 'package:attendance/core/themes/styles/app_text_style.dart';
import 'package:attendance/core/widgets/avatar_view.dart';
import 'package:attendance/core/widgets/attatchements/cashed_images.dart';
import 'package:attendance/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

/// Modern User Info Card with Attendance Controls
class UserAttendInfoCard extends StatefulWidget {
  const UserAttendInfoCard({
    super.key,
    this.isSamePerson = false,
    required this.employeeInformation,
    this.onAttendTap,
    this.onLeaveTap,
  });

  final bool isSamePerson;
  final EmployeeInformation employeeInformation;
  final VoidCallback? onAttendTap, onLeaveTap;

  @override
  State<UserAttendInfoCard> createState() => _UserAttendInfoCardState();
}

class _UserAttendInfoCardState extends State<UserAttendInfoCard>
    with TickerProviderStateMixin {
  double progress = 0;
  int fullValue = 0;
  int remainingValue = 0;
  Timer? timer;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
    _animationController.forward();

    final shift = widget.employeeInformation.shiftView!;
    final start = shift.start;
    final end = shift.end;
    fullValue = end.difference(start).inSeconds;

    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      final now = DateTime.now();

      if (now.isBefore(start)) {
        setState(() {
          remainingValue = fullValue;
          progress = 0;
        });
      } else if (now.isAfter(end)) {
        setState(() {
          remainingValue = 0;
          progress = 1.0;
        });
        t.cancel();
      } else {
        final elapsed = now.difference(start).inSeconds;
        final remaining = end.difference(now).inSeconds;
        setState(() {
          remainingValue = remaining;
          progress = elapsed / fullValue;
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final employeeView = widget.employeeInformation.employeeView;

    return FadeTransition(
      opacity: _fadeAnimation,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              spreadRadius: 0,
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            // Header with Gradient Background
            Container(
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    LightColors.primaryColor.withValues(alpha: 0.1),
                    LightColors.primaryColor.withValues(alpha: 0.05),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
              ),
              child: Column(
                children: [
                  // Profile Section
                  Row(
                    children: [
                      // Profile Image
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: LightColors.primaryColor.withValues(alpha: 0.3),
                              spreadRadius: 0,
                              blurRadius: 10,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: employeeView!.imageUrl != null &&
                                employeeView.imageUrl!.isNotEmpty
                            ? CachedImage(
                                width: 60.w,
                                height: 60.w,
                                radius: 60.w,
                                elevation: 0,
                                url: employeeView.imageUrl ?? "",
                              )
                            : AvatarView(
                                name: employeeView.name ?? "AL",
                                raduis: 30.w,
                              ),
                      ),
                      
                      SizedBox(width: 16.w),
                      
                      // User Info
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              employeeView.name ?? "AL",
                              style: AppTextStyles.bold(context).copyWith(
                                fontSize: 20.sp,
                                color: LightColors.textColor,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              "Flutter Developer",
                              style: AppTextStyles.regular(context).copyWith(
                                fontSize: 14.sp,
                                color: LightColors.darkGreyColor,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Row(
                              children: [
                                Icon(
                                  Icons.access_time,
                                  size: 14.sp,
                                  color: LightColors.primaryColor,
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  "${"work_time".tr} ${DateFormat("HH:mm").format(widget.employeeInformation.shiftView!.start)} - ${DateFormat("HH:mm").format(widget.employeeInformation.shiftView!.end)}",
                                  style: AppTextStyles.regular(context).copyWith(
                                    fontSize: 12.sp,
                                    color: LightColors.darkGreyColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      
                      // Status Indicator
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: progress < 1.0 
                              ? LightColors.greenColor.withValues(alpha: 0.1)
                              : LightColors.yelloColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          progress < 1.0 ? "active".tr : "completed".tr,
                          style: AppTextStyles.medium(context).copyWith(
                            fontSize: 10.sp,
                            color: progress < 1.0 
                                ? LightColors.greenColor
                                : LightColors.yelloColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  SizedBox(height: 24.h),
                  
                  // Progress Section
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${"remaining_time".tr}",
                            style: AppTextStyles.medium(context).copyWith(
                              fontSize: 14.sp,
                              color: LightColors.darkGreyColor,
                            ),
                          ),
                          Text(
                            formatDuration(remainingValue),
                            style: AppTextStyles.bold(context).copyWith(
                              fontSize: 16.sp,
                              color: LightColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: LinearProgressIndicator(
                          value: progress.clamp(0.0, 1.0),
                          backgroundColor: LightColors.greyColor.withValues(alpha: 0.2),
                          valueColor: AlwaysStoppedAnimation<Color>(
                            progress < 1.0 ? LightColors.primaryColor : LightColors.greenColor,
                          ),
                          minHeight: 8.h,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            // Action Buttons
            if (widget.isSamePerson) ...[
              Padding(
                padding: EdgeInsets.all(24.w),
                child: Column(
                  children: [
                    // Attend Button
                    SizedBox(
                      width: double.infinity,
                      height: 48.h,
                      child: ElevatedButton(
                        onPressed: widget.onAttendTap,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: LightColors.primaryColor,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              Assets.icons.biomet,
                              width: 20.w,
                              height: 20.h,
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              'start_attendance'.tr,
                              style: AppTextStyles.semiBold(context).copyWith(
                                fontSize: 16.sp,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    SizedBox(height: 12.h),
                    
                    // Leave Button
                    SizedBox(
                      width: double.infinity,
                      height: 48.h,
                      child: OutlinedButton(
                        onPressed: widget.onLeaveTap,
                        style: OutlinedButton.styleFrom(
                          foregroundColor: LightColors.redColor,
                          side: BorderSide(
                            color: LightColors.redColor,
                            width: 1.5,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              Assets.icons.logout,
                              width: 20.w,
                              height: 20.h,
                              colorFilter: const ColorFilter.mode(
                                LightColors.redColor,
                                BlendMode.srcIn,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              'end_attendance'.tr,
                              style: AppTextStyles.semiBold(context).copyWith(
                                fontSize: 16.sp,
                                color: LightColors.redColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  String formatDuration(int seconds) {
    final duration = Duration(seconds: seconds);
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final secs = twoDigits(duration.inSeconds.remainder(60));
    return "$hours:$minutes:$secs";
  }
}
