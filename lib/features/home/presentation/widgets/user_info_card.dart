import 'package:attendance/core/models/account_model/employee_info.dart';
import 'package:attendance/core/widgets/avatar_view.dart';
import 'package:attendance/core/widgets/cashed_images.dart';
import 'package:attendance/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

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
  late DateTime startTime;
  late DateTime endTime;
  @override
  void initState() {
    super.initState();
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
        padding: const EdgeInsetsGeometry.symmetric(
          horizontal: 16,
          vertical: 26,
        ),
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
              "${"remaining_time".tr} 5:00:00",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 5),
            Text(
              "${"work_time".tr} ${"from".tr} ${widget.employeeInformation.shiftView?.startTime} ${"to".tr} ${widget.employeeInformation.shiftView?.endTime}",
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            const LinearProgressIndicator(value: 0.5),
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

            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.red,
            //   ),
            //   onPressed: () {},
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       SvgPicture.asset(
            //         Assets.icons.logout,
            //         width: 20,
            //         height: 20,
            //         colorFilter: const ColorFilter.mode(
            //           Colors.white,
            //           BlendMode.srcIn,
            //         ),
            //       ),
            //       const SizedBox(width: 10),
            //       Text('end_attendance'.tr),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
