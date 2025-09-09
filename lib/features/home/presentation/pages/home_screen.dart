import 'package:attendance/core/routes/pages_keys.dart';
import 'package:attendance/core/widgets/app_text_field.dart';
import 'package:attendance/core/widgets/title_tale.dart';
import 'package:attendance/features/home/presentation/controller/home_controller.dart';
import 'package:attendance/features/home/presentation/view/attendance_List_widget.dart';
import 'package:attendance/features/home/presentation/view/person_manage_on_list.dart';
import 'package:attendance/features/home/presentation/widgets/user_info_card.dart';
import 'package:attendance/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

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
            controller: controller.scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: UserAttendInfoCard(
                  isSamePerson: true,
                  employeeInformation: controller.employeeInformation,
                ),
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
                      Get.toNamed(
                        "${PageKeys.allAttendCalender}/${controller.employeeInformation.employeeView!.id}",
                      );
                    },
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverFillRemaining(
                hasScrollBody: false,

                child: controller.gettingAttendance
                    ? const Center(child: CircularProgressIndicator.adaptive())
                    : AttendanceListWidget(
                        attendances:
                            controller.attendancesDayEvent.first.attendances ??
                            [],
                      ),
              ),
              if (controller.employeeInformation.employeeView!.isManager ==
                  true)
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
              if (controller.employeeInformation.employeeView!.isManager ==
                  true)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 10,
                    ).w,
                    child: AppTextField(
                      controller: controller.searchController,
                      hint: "search".tr,
                      onChanged: (value) => controller.onSearch(),
                      prefixIcon: SvgPicture.asset(
                        Assets.icons.search,
                        width: 20,
                        height: 20,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ),
              if (controller.employeeInformation.employeeView!.isManager ==
                  true)
                PersonManageOnList(employees: controller.employees),
              if (controller.isLoading)
                const SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(child: CircularProgressIndicator.adaptive()),
                ),
              if (controller.employeeInformation.employeeView!.isManager ==
                  true)
                const SliverToBoxAdapter(child: SizedBox(height: 100)),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: MediaQuery.of(context).viewInsets.bottom,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
