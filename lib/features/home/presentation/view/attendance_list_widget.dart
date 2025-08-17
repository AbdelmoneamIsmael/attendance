import 'package:attendance/core/const/enums.dart';
import 'package:attendance/core/widgets/attendace_timeline_node.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:timelines_plus/timelines_plus.dart';

class AttendanceListWidget extends StatelessWidget {
  const AttendanceListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30).w,
      child: FixedTimeline(
        theme: TimelineThemeData(
          nodePosition: 0,
          color: Colors.grey,
          indicatorTheme: const IndicatorThemeData(position: 0, size: 20),
        ),
        children: List.generate(
          6,
          (index) => TimeLineNodeWidget(
            type: index % 2 == 0
                ? AttendanceType.attendIn
                : AttendanceType.attendOut,
            firstNode: index == 0,
            lastNode: index == 5,
            
          ),
        ),
      ),
    );
  }
}
