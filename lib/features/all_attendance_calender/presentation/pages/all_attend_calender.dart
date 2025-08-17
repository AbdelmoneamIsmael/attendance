import 'package:attendance/features/all_attendance_calender/presentation/controller/all_attendance_calender_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllAttendCalender extends GetView<AttendCalenderController> {
  const AllAttendCalender({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AllAttendCalender')),

      body: const SafeArea(child: Text('AllAttendCalenderController')),
    );
  }
}
