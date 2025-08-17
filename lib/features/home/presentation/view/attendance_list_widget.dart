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
          4,
          (index) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20.0,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    index % 2 == 0 ? "attendance_in".tr : "attendance_out".tr,
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
                          color: index % 2 == 0 ? Colors.green : Colors.red,
                        ),
                      ],
                    ),
                    startConnector: index == 0
                        ? DashedLineConnector(
                            color: index % 2 == 0 ? Colors.green : Colors.red,
                          )
                        : SolidLineConnector(
                            color: index % 2 == 0 ? Colors.green : Colors.red,
                          ),
                    endConnector: index + 1 == 10
                        ? null
                        : SolidLineConnector(
                            color: index % 2 != 0 ? Colors.green : Colors.red,
                          ),
                  ),
                ),
              ),
              const Expanded(
                child: Center(child: Text("11:00:00 AM - 23-12-2022")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
