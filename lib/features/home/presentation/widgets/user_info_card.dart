import 'dart:async';
import 'package:attendance/core/models/account_model/employee_info.dart';
import 'package:attendance/core/widgets/avatar_view.dart';
import 'package:attendance/core/widgets/attatchements/cashed_images.dart';
import 'package:attendance/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

/// كارت معلومات الموظف + متابعة الحضور والانصراف
class UserAttendInfoCard extends StatefulWidget {
  const UserAttendInfoCard({
    super.key,
    this.isSamePerson = false, // هل المستخدم الحالي هو نفس الموظف
    required this.employeeInformation,
    this.onAttendTap, // حدث الضغط على زر الحضور
    this.onLeaveTap, // حدث الضغط على زر الانصراف
  });

  final bool isSamePerson;
  final EmployeeInformation employeeInformation;
  final VoidCallback? onAttendTap, onLeaveTap;

  @override
  State<UserAttendInfoCard> createState() => _UserAttendInfoCardState();
}

class _UserAttendInfoCardState extends State<UserAttendInfoCard> {
  double progress = 0; // نسبة التقدم في وقت الشيفت (من 0 لـ 1)
  int fullValue = 0; // إجمالي مدة الشيفت بالثواني
  int remainingValue = 0; // الوقت المتبقي بالثواني
  Timer? timer;

  @override
  void initState() {
    super.initState();

    // حساب وقت الشيفت
    final shift = widget.employeeInformation.shiftView!;
    final start = shift.start;
    final end = shift.end;
    fullValue = end.difference(start).inSeconds;

    // تايمر يحدث كل ثانية لحساب الوقت المتبقي والتقدم
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      final now = DateTime.now();

      if (now.isBefore(start)) {
        // قبل بداية الشيفت
        setState(() {
          remainingValue = fullValue;
          progress = 0;
        });
      } else if (now.isAfter(end)) {
        // بعد انتهاء الشيفت
        setState(() {
          remainingValue = 0;
          progress = 1.0;
        });
        t.cancel();
      } else {
        // أثناء الشيفت
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
    timer?.cancel(); // إيقاف التايمر عند التخلص من الودجت
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
            // صورة الموظف
            if (employeeView!.imageUrl != null &&
                employeeView.imageUrl!.isNotEmpty)
              CachedImage(
                width: 100,
                height: 100,
                radius: 100,
                elevation: 4,
                url: employeeView.imageUrl ?? "",
              ),
            // صورة افتراضية بالاسم لو مفيش صورة
            AvatarView(name: employeeView.name ?? "AL"),
            const SizedBox(height: 20),

            // اسم الموظف
            Text(
              employeeView.name ?? "AL",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 5),

            // الوظيفة (ثابتة كمثال)
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

            // رقم الهاتف
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

            // البريد الإلكتروني
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

            // الوقت المتبقي
            Text(
              "${"remaining_time".tr} ${formatDuration(remainingValue)}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 5),

            // وقت العمل
            Text(
              "${"work_time".tr} ${"from".tr} "
              "${DateFormat("hh:mm a").format(widget.employeeInformation.shiftView!.start)} "
              "${"to".tr} ${DateFormat("hh:mm a").format(widget.employeeInformation.shiftView!.end)}",
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),

            const SizedBox(height: 20),

            // شريط التقدم (progress bar)
            LinearProgressIndicator(value: progress.clamp(0.0, 1.0)),

            const SizedBox(height: 20),

            // زر بدء الحضور
            if (widget.isSamePerson)
              ElevatedButton(
                onPressed: widget.onAttendTap,
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

            if (widget.isSamePerson) const SizedBox(height: 20),

            // زر إنهاء الحضور
            if (widget.isSamePerson)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.red),
                  ),
                ),
                onPressed: widget.onLeaveTap,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Assets.icons.logout,
                      width: 20,
                      height: 20,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text('end_attendance'.tr),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  /// تحويل الثواني لعرضها كـ (ساعات:دقايق:ثواني)
  String formatDuration(int seconds) {
    final duration = Duration(seconds: seconds);
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final secs = twoDigits(duration.inSeconds.remainder(60));
    return "$hours:$minutes:$secs";
  }
}
