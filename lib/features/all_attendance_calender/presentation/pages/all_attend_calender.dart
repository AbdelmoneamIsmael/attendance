import 'package:attendance/core/widgets/no_data_widget.dart';
import 'package:attendance/features/all_attendance_calender/presentation/controller/all_attendance_calender_controller.dart';
import 'package:attendance/features/home/presentation/view/attendance_list_widget.dart';
import 'package:attendance/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:intl/intl.dart';

class AllAttendCalender extends GetView<AttendCalenderController> {
  const AllAttendCalender({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AttendCalenderController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(title: Text('all_attendance'.tr)),

        body: controller.isLoading
            ? const Center(child: CircularProgressIndicator.adaptive())
            : controller.dateEvents.isEmpty
            ? Center(
                child: NoDataWidget(
                  iconPath: Assets.icons.about,
                  title: "",
                  description: 'no_attendance_record'.tr,
                ),
              )
            : CustomScrollView(
                controller: controller.scrollController,
                slivers: [
                  ...List.generate(
                    controller.dateEvents.length,
                    (index) => SliverStickyHeader.builder(
                      builder: (context, state) => StickyHeaderWidget(
                        title: controller.dateEvents[index].date!,
                      ),

                      sliver: SliverToBoxAdapter(
                        child: AttendanceListWidget(
                          attendances:
                              controller.dateEvents[index].attendances!,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class StickyHeaderWidget extends StatelessWidget {
  const StickyHeaderWidget({super.key, required this.title});
  final DateTime title;

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
          DateFormat("dd/MM/yyyy").format(title),
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
