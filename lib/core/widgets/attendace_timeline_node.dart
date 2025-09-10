import 'package:attendance/core/const/enums.dart';
import 'package:attendance/core/models/attendance_events/attendance_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_cli/common/utils/json_serialize/helpers.dart';
import 'package:intl/intl.dart';
import 'package:timelines_plus/timelines_plus.dart';

class TimeLineNodeWidget extends StatelessWidget {
  const TimeLineNodeWidget({
    required this.attendanceEvent,
    super.key,
    required this.type,
    this.firstNode = false,
    this.lastNode = false,
  });
  final AttendanceType type;
  final bool firstNode, lastNode;
  final AttendanceEvent attendanceEvent;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20.0,
      children: [
        Expanded(child: Center(child: Text(getAttendTypeName(type)))),
        Expanded(
          child: SizedBox(
            height: 80.0.h,
            child: TimelineNode(
              indicator: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [DotIndicator(color: getColor(type))],
              ),
              startConnector: firstNode && AttendanceType.attendOut == type
                  ? null
                  : firstNode && AttendanceType.attendIn == type
                  ? DashedLineConnector(color: getColor(type))
                  : SolidLineConnector(color: getColor(type)),
              endConnector: lastNode
                  ? null
                  : SolidLineConnector(color: getColor(type)),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              DateFormat(
                "h:mm a - dd/MM/yyyy",
              ).format(attendanceEvent.date ?? DateTime.now()),
            ),
          ),
        ),
      ],
    );
  }

  Color getColor(AttendanceType type) {
    switch (type) {
      case AttendanceType.attendIn:
        return Colors.green;
      case AttendanceType.attendOut:
        return Colors.blue;
      case AttendanceType.absent:
        return Colors.red;
      case AttendanceType.vocation:
        return Colors.purple;
    }
  }

  String getAttendTypeName(AttendanceType type) {
    switch (type) {
      case AttendanceType.attendIn:
        return "attendance_in".tr;
      case AttendanceType.attendOut:
        return "attendance_out".tr;
      case AttendanceType.absent:
        return "absent".tr;
      case AttendanceType.vocation:
        return "vocation".tr;
    }
  }
}
