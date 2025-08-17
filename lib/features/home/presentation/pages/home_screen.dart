import 'package:attendance/core/routes/pages_keys.dart';
import 'package:attendance/core/widgets/cashed_images.dart';
import 'package:attendance/core/widgets/title_tale.dart';
import 'package:attendance/features/home/presentation/controller/home_controller.dart';
import 'package:attendance/features/home/presentation/view/attendance_List_widget.dart';
import 'package:attendance/features/home/presentation/view/person_manage__on_list.dart';
import 'package:attendance/features/home/presentation/widgets/user_info_card.dart';
import 'package:attendance/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:timelines_plus/timelines_plus.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home_screen_title'.tr),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Badge.count(
              count: 3,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: Icon(
                    Icons.notifications,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onPressed: () {
                    Get.toNamed(PageKeys.notificationScreen);
                  },
                ),
              ),
            ),
          ),
        ],
      ),

      body: GetBuilder<HomeController>(
        init: HomeController(),
        initState: (_) {},
        builder: (_) {
          return CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: UserAttendInfoCard()),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 10,
                  ).w,
                  child: TitleTale(
                    title: "attendance_list".tr,
                    trailing: "show_all".tr,
                    onTap: () {
                      Get.toNamed(PageKeys.allAttendCalender);
                    },
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              const SliverFillRemaining(
                hasScrollBody: false,

                child: AttendanceListWidget(),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 20,
                  ).w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "depart_employee".tr,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const PersonManageOnList(),
            ],
          );
        },
      ),
    );
  }
}
