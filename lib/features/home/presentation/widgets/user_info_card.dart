import 'package:attendance/core/widgets/cashed_images.dart';
import 'package:attendance/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class UserAttendInfoCard extends StatelessWidget {
  const UserAttendInfoCard({super.key, this.isSamePerson = false});
  final bool isSamePerson;

  @override
  Widget build(BuildContext context) {
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
            const CachedImage(
              width: 100,
              height: 100,
              radius: 100,
              elevation: 4,
              url:
                  "https://media.istockphoto.com/id/1042466484/photo/smiling-handsome-man-in-gray-t-shirt-standing-with-crossed-arms-isolated-on-grey-background.jpg?s=612x612&w=0&k=20&c=m0Xz8b_yc1BFcELffDrLjdFsuqICZCVz_oAN4B87orY=",
            ),
            const SizedBox(height: 20),
            const Text(
              "Abdelmoneam Ismael",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.phone, color: Colors.grey, size: 12),
                SizedBox(width: 10),
                Text(
                  "+201012345678",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 5),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Icon(Icons.email, color: Colors.grey, size: 12),
                SizedBox(width: 10),
                Text(
                  "jH2Pn@example.com",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
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
              "${"work_time".tr} ${"from".tr} 8:00:00 ${"to".tr} 16:00:00",
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            const LinearProgressIndicator(value: 0.5),
            const SizedBox(height: 20),
            if (isSamePerson)
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
