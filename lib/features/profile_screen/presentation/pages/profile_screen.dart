import 'package:attendance/core/routes/pages_keys.dart';
import 'package:attendance/core/widgets/title_tale.dart';
import 'package:attendance/features/home/presentation/view/attendance_List_widget.dart';
import 'package:attendance/features/home/presentation/view/person_manage_on_list.dart';
import 'package:attendance/features/home/presentation/widgets/user_info_card.dart';
import 'package:attendance/features/profile_screen/presentation/cubit/profile_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ProfileScreen')),

      body: GetBuilder<ProfileController>(
        init: ProfileController(),
        initState: (_) {},
        builder: (_) {
          return CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: UserAttendInfoCard(isSamePerson: false),
              ),
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
              if (controller.haveGroup)
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
              if (controller.haveGroup) const PersonManageOnList(),
            ],
          );
        },
      ),
    );
  }
}
