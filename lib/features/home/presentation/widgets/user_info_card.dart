import 'dart:async';

import 'package:attendance/core/models/account_model/employee_info.dart';
import 'package:attendance/core/widgets/avatar_view.dart';
import 'package:attendance/core/widgets/attatchements/cashed_images.dart';
import 'package:attendance/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class UserAttendInfoCard extends StatefulWidget {
  const UserAttendInfoCard({
    super.key,
    this.isSamePerson = false,
    required this.employeeInformation,
  });
  final bool isSamePerson;
  final EmployeeInformation employeeInformation;

  @override
  State<UserAttendInfoCard> createState() => _UserAttendInfoCardState();
}

class _UserAttendInfoCardState extends State<UserAttendInfoCard> {
  double progress = 0;
  int fullValue = 0; // total shift duration in seconds
  int remainingValue = 0; // remaining time in seconds
  Timer? timer;

  @override
  void initState() {
    super.initState();

    final shift = widget.employeeInformation.shiftView!;
    final start = shift.start;
    final end = shift.end;

    fullValue = end.difference(start).inSeconds;

    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      final now = DateTime.now();

      if (now.isBefore(start)) {
        // Shift not started
        setState(() {
          remainingValue = fullValue;
          progress = 0;
        });
      } else if (now.isAfter(end)) {
        // Shift ended
        setState(() {
          remainingValue = 0;
          progress = 1.0;
        });
        t.cancel();
      } else {
        // Inside shift range
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final employeeView = widget.employeeInformation.employeeView;
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
        child: Column(
          children: [
            if (employeeView!.imageUrl != null &&
                employeeView.imageUrl!.isNotEmpty)
              CachedImage(
                width: 100,
                height: 100,
                radius: 100,
                elevation: 4,
                url: employeeView.imageUrl ?? "",
              ),
            AvatarView(name: employeeView.name ?? "AL"),
            const SizedBox(height: 20),
            Text(
              employeeView.name ?? "AL",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.work, color: Colors.grey, size: 12),
                SizedBox(width: 10),
                Text(
                  "Flutter Developer",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.phone, color: Colors.grey, size: 12),
                const SizedBox(width: 10),
                Text(
                  employeeView.phoneNumber ?? "",
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.email, color: Colors.grey, size: 12),
                const SizedBox(width: 10),
                Text(
                  employeeView.email ?? "",
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "${"remaining_time".tr} ${formatDuration(remainingValue)}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 5),
            Text(
              "${"work_time".tr} ${"from".tr} "
              "${DateFormat("hh:mm a").format(widget.employeeInformation.shiftView!.start)} "
              "${"to".tr} ${DateFormat("hh:mm a").format(widget.employeeInformation.shiftView!.end)}",
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            LinearProgressIndicator(value: progress),
            const SizedBox(height: 20),
            if (widget.isSamePerson)
              ElevatedButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Assets.icons.biomet,
                      width: 20,
                      height: 20,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text('start_attendance'.tr),
                  ],
                ),
              ),
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
