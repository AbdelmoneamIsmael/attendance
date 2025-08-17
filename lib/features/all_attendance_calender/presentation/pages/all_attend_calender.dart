import 'package:attendance/core/const/enums.dart';
import 'package:attendance/core/widgets/attendace_timeline_node.dart';
import 'package:attendance/features/all_attendance_calender/presentation/controller/all_attendance_calender_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:timelines_plus/timelines_plus.dart';

class AllAttendCalender extends GetView<AttendCalenderController> {
  const AllAttendCalender({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AllAttendCalender')),

      body: CustomScrollView(
        slivers: [
          ...List.generate(
            10,
            (index) => SliverStickyHeader.builder(
              builder: (context, state) => const StickyHeaderWidget(),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, i) => FixedTimeline(
                    theme: TimelineThemeData(
                      nodePosition: 0,
                      color: Colors.grey,
                      indicatorTheme: const IndicatorThemeData(
                        position: 0,
                        size: 20,
                      ),
                    ),
                    children: [
                      TimeLineNodeWidget(
                        type: i % 2 == 0
                            ? AttendanceType.attendIn
                            : AttendanceType.attendOut,
                        firstNode: i == 0,
                        lastNode: i == 4,
                      ),
                    ],
                  ),
                  childCount: 4,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StickyHeaderWidget extends StatelessWidget {
  const StickyHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(16.0),
            bottomRight: Radius.circular(16.0),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        alignment: Alignment.centerLeft,
        child: Text(
          '${'date'.tr} ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
