import 'package:attendance/core/const/enums.dart';
import 'package:attendance/core/models/attendance_events/attendance_response_model.dart';
import 'package:attendance/core/themes/colors/colors.dart';
import 'package:attendance/core/themes/styles/app_text_style.dart';
import 'package:attendance/core/widgets/attendace_timeline_node.dart';
import 'package:flutter_svg/svg.dart';
import 'package:attendance/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:timelines_plus/timelines_plus.dart';

class AttendanceListWidget extends StatelessWidget {
  const AttendanceListWidget({super.key, required this.attendances});
  final List<AttendanceEvent> attendances;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      child: attendances.isEmpty
          ? _buildEmptyState(context)
          : _buildTimeline(context),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: LightColors.primaryColor.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              Assets.icons.about,
              width: 40.w,
              height: 40.h,
              colorFilter: const ColorFilter.mode(
                LightColors.primaryColor,
                BlendMode.srcIn,
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            'no_attendance'.tr,
            style: AppTextStyles.semiBold(
              context,
            ).copyWith(fontSize: 16.sp, color: LightColors.darkGreyColor),
          ),
          SizedBox(height: 8.h),
          Text(
            'no_attendance_record'.tr,
            style: AppTextStyles.regular(
              context,
            ).copyWith(fontSize: 14.sp, color: LightColors.greyColor),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildTimeline(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: LightColors.primaryColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(
                Icons.access_time,
                color: LightColors.primaryColor,
                size: 20.sp,
              ),
            ),
            SizedBox(width: 12.w),
            Text(
              'today_attendance'.tr,
              style: AppTextStyles.bold(
                context,
              ).copyWith(fontSize: 16.sp, color: LightColors.textColor),
            ),
            const Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: LightColors.greenColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                '${attendances.length} ${'records'.tr}',
                style: AppTextStyles.medium(
                  context,
                ).copyWith(fontSize: 12.sp, color: LightColors.greenColor),
              ),
            ),
          ],
        ),

        SizedBox(height: 20.h),

        // Timeline
        FixedTimeline(
          theme: TimelineThemeData(
            nodePosition: 0,
            color: LightColors.greyColor.withValues(alpha: 0.3),
            indicatorTheme: IndicatorThemeData(position: 0, size: 20.w),
            connectorTheme: ConnectorThemeData(
              thickness: 2.w,
              color: LightColors.greyColor.withValues(alpha: 0.3),
            ),
          ),
          children: List.generate(
            attendances.length,
            (index) => Container(
              margin: const EdgeInsets.only(bottom: 0),
              child: TimeLineNodeWidget(
                attendanceEvent: attendances[index],
                type: AttendanceType
                    .values[attendances[index].attendanceType?.toInt() ?? 0],
                firstNode: index == 0,
                lastNode: index == (attendances.length) - 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
