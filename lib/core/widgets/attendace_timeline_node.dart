import 'package:attendance/core/const/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:timelines_plus/timelines_plus.dart';

class TimeLineNodeWidget extends StatelessWidget {
  const TimeLineNodeWidget({
    super.key,
    required this.type,
    this.firstNode = false,
    this.lastNode = false,
  });
  final AttendanceType type;
  final bool firstNode, lastNode;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20.0,
      children: [
        Expanded(
          child: Center(
            child: Text(
              type == AttendanceType.attendIn
                  ? "attendance_in".tr
                  : "attendance_out".tr,
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 80.0.h,
            child: TimelineNode(
              indicator: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  DotIndicator(
                    color: AttendanceType.attendIn == type
                        ? Colors.green
                        : Colors.red,
                  ),
                ],
              ),
              startConnector: firstNode && AttendanceType.attendOut == type
                  ? null
                  : firstNode && AttendanceType.attendIn == type
                  ? const DashedLineConnector(color: Colors.green)
                  : SolidLineConnector(
                      color: AttendanceType.attendIn == type
                          ? Colors.green
                          : Colors.red,
                    ),
              endConnector: lastNode
                  ? null
                  : SolidLineConnector(
                      color: AttendanceType.attendIn != type
                          ? Colors.green
                          : Colors.red,
                    ),
            ),
          ),
        ),
        const Expanded(child: Center(child: Text("11:00:00 AM - 23-12-2022"))),
      ],
    );
  }
}
