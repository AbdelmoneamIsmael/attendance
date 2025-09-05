import 'package:attendance/core/controllers/auth_controller/auth_controller.dart';
import 'package:attendance/core/routes/pages_keys.dart';
import 'package:attendance/core/widgets/app_text_field.dart';
import 'package:attendance/core/widgets/title_tale.dart';
import 'package:attendance/features/home/presentation/view/attendance_List_widget.dart';
import 'package:attendance/features/home/presentation/view/person_manage_on_list.dart';
import 'package:attendance/features/home/presentation/widgets/user_info_card.dart';
import 'package:attendance/features/profile_screen/presentation/cubit/profile_screen_controller.dart';
import 'package:attendance/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final employeeId = Get.parameters['employeeID']!;
    final controller = Get.find<ProfileController>(tag: employeeId);
    return Scaffold(
      appBar: AppBar(title: const Text('ProfileScreen')),

      body: GetBuilder<ProfileController>(
        tag: employeeId,
        initState: (_) {},
        builder: (_) {
          return RefreshIndicator(
            onRefresh: controller.onRefresh,
            child: controller.profileScreenStatus == ProfileScreenStatus.loading
                ? const Center(child: CircularProgressIndicator.adaptive())
                : controller.profileScreenStatus == ProfileScreenStatus.error
                ? Center(child: Text("error_message".tr))
                : CustomScrollView(
                    controller: controller.scrollController,
                    slivers: [
                      SliverToBoxAdapter(
                        child: UserAttendInfoCard(
                          isSamePerson: false,
                          employeeInformation: controller.employeeInformation!,
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
                      if (controller
                          .employeeInformation!
                          .employeeView!
                          .isManager!)
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
                      if (controller
                              .employeeInformation!
                              .employeeView!
                              .isManager ==
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
                      if (controller
                          .employeeInformation!
                          .employeeView!
                          .isManager!)
                        PersonManageOnList(employees: controller.employees),
                      if (controller.isLoading)
                        const SliverToBoxAdapter(
                          child: Center(
                            child: CircularProgressIndicator.adaptive(),
                          ),
                        ),
                      const SliverToBoxAdapter(child: SizedBox(height: 100)),
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: MediaQuery.viewInsetsOf(context).bottom,
                        ),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
