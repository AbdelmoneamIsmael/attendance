import 'package:attendance/core/const/enums.dart';
import 'package:attendance/core/models/attendance_events/attendance_response_model.dart';
import 'package:attendance/core/widgets/attendace_timeline_node.dart';
import 'package:attendance/core/widgets/no_data_widget.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30).w,
      child: attendances.isEmpty
          ? Center(
              child: NoDataWidget(
                description: 'no_attendance'.tr,
                title: "",
                iconPath: Assets.icons.about,
              ),
            )
          : FixedTimeline(
              theme: TimelineThemeData(
                nodePosition: 0,
                color: Colors.grey,
                indicatorTheme: const IndicatorThemeData(position: 0, size: 20),
              ),
              children: List.generate(
                attendances.length,
                (index) => TimeLineNodeWidget(
                  attendanceEvent: attendances[index],
                  type: AttendanceType
                      .values[attendances[index].attendanceType?.toInt() ?? 0],
                  firstNode: index == 0,
                  lastNode: index == (attendances.length) - 1,
                ),
              ),
            ),
    );
  }
}
