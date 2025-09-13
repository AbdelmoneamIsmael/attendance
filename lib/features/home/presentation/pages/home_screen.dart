import 'package:attendance/core/controllers/auth_controller/auth_controller.dart';
import 'package:attendance/core/routes/pages_keys.dart';
import 'package:attendance/core/themes/colors/colors.dart';
import 'package:attendance/core/themes/styles/app_text_style.dart';
import 'package:attendance/core/widgets/app_text_field.dart';
import 'package:attendance/core/widgets/loading_over_lay.dart';
import 'package:attendance/features/home/presentation/controller/home_controller.dart';
import 'package:attendance/features/home/presentation/controller/notifcation_stream_controller.dart';
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
      backgroundColor: LightColors.backgroundColor,
      body: GetBuilder<HomeController>(
        init: HomeController(),
        initState: (_) {},
        builder: (_) {
          return Stack(
            children: [
              RefreshIndicator(
                onRefresh: controller.refreshHomePage,
                child: CustomScrollView(
                  controller: controller.scrollController,
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    // Modern App Bar
                    SliverAppBar(
                      expandedHeight: 120.h,
                      toolbarHeight: 70.h,
                      floating: false,
                      pinned: true,
                      backgroundColor: LightColors.primaryColor,
                      elevation: 0,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                LightColors.primaryColor,
                                LightColors.primaryColor.withValues(alpha: 0.8),
                              ],
                            ),
                          ),
                          child: SafeArea(
                            child: Padding(
                              padding: EdgeInsets.all(20.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  // Welcome Text
                                  Text(
                                    'welcome_back'.tr,
                                    style: AppTextStyles.regular(context)
                                        .copyWith(
                                          color: Colors.white.withValues(
                                            alpha: 0.8,
                                          ),
                                          fontSize: 14.sp,
                                        ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    controller
                                            .employeeInformation
                                            .employeeView
                                            ?.name ??
                                        'User',
                                    style: AppTextStyles.bold(context).copyWith(
                                      color: Colors.white,
                                      fontSize: 24.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      actions: [
                        // Notification Button
                        GetX<NotifcationStreamController>(
                          init: NotifcationStreamController(),
                          builder: (notifcationController) => Container(
                            margin: EdgeInsets.only(
                              right: 8.w,
                              top: 8.h,
                              bottom: 8.h,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Badge.count(
                              count: notifcationController.notifyNumber.value,
                              backgroundColor:
                                  notifcationController.notifyNumber.value == 0
                                  ? Colors.transparent
                                  : LightColors.redColor,
                              textColor:
                                  notifcationController.notifyNumber.value == 0
                                  ? Colors.transparent
                                  : Colors.white,
                              child: IconButton(
                                icon: Icon(
                                  Icons.notifications_outlined,
                                  color: Colors.white,
                                  size: 24.sp,
                                ),
                                onPressed: () {
                                  Get.toNamed(PageKeys.notificationScreen);
                                },
                              ),
                            ),
                          ),
                        ),
                        // Logout Button
                        Container(
                          margin: EdgeInsets.only(
                            right: 20.w,
                            top: 8.h,
                            bottom: 8.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: IconButton(
                            icon: SvgPicture.asset(
                              Assets.icons.logout,
                              width: 20.w,
                              height: 20.h,
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                            onPressed: () {
                              Get.find<AuthController>().logout();
                              Get.offNamed(PageKeys.loginScreen);
                            },
                          ),
                        ),
                        const SizedBox(width: 20),
                      ],
                    ),

                    // User Info Card
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.all(20.w),
                        child: UserAttendInfoCard(
                          onAttendTap: controller.onAttendTap,
                          onLeaveTap: controller.onLeaveTap,
                          isSamePerson: true,
                          employeeInformation: controller.employeeInformation,
                        ),
                      ),
                    ),

                    // // Quick Stats Section
                    // SliverToBoxAdapter(
                    //   child: Padding(
                    //     padding: EdgeInsets.symmetric(horizontal: 20.w),
                    //     child: _buildQuickStatsSection(context),
                    //   ),
                    // ),
                    const SliverToBoxAdapter(child: SizedBox(height: 20)),

                    // Attendance List Section
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: _buildSectionHeader(
                          context,
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

                    const SliverToBoxAdapter(child: SizedBox(height: 16)),

                    // Attendance List
                    SliverToBoxAdapter(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              spreadRadius: 0,
                              blurRadius: 10,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.r),
                          child: controller.gettingAttendance
                              ? SizedBox(
                                  height: 200.h,
                                  child: const Center(
                                    child: CircularProgressIndicator.adaptive(),
                                  ),
                                )
                              : AttendanceListWidget(
                                  attendances:
                                      controller.attendancesDayEvent.isEmpty
                                      ? []
                                      : controller
                                                .attendancesDayEvent
                                                .first
                                                .attendances ??
                                            [],
                                ),
                        ),
                      ),
                    ),

                    // Manager Section
                    if (controller
                            .employeeInformation
                            .employeeView!
                            .isManager ==
                        true) ...[
                      const SliverToBoxAdapter(child: SizedBox(height: 32)),

                      // Department Employees Header
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: _buildSectionHeader(
                            context,
                            title: "depart_employee".tr,
                            showTrailing: false,
                          ),
                        ),
                      ),

                      const SliverToBoxAdapter(child: SizedBox(height: 16)),

                      // Search Field
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.05),
                                  spreadRadius: 0,
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: AppTextField(
                              controller: controller.searchController,
                              hint: "search".tr,
                              onChanged: (value) => controller.onSearch(),
                              prefixIcon: SvgPicture.asset(
                                Assets.icons.search,
                                width: 20.w,
                                height: 20.h,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SliverToBoxAdapter(child: SizedBox(height: 16)),

                      // Employees List - Use directly as sliver
                      PersonManageOnList(employees: controller.employees),

                      const SliverToBoxAdapter(child: SizedBox(height: 100)),
                    ],

                    // Loading State
                    if (controller.isLoading)
                      const SliverFillRemaining(
                        hasScrollBody: false,
                        child: Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                      ),

                    // Bottom Padding
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: MediaQuery.of(context).viewInsets.bottom + 20.h,
                      ),
                    ),
                  ],
                ),
              ),

              // Loading Overlay
              Visibility(
                visible: controller.isDoingAttendOperations,
                child: const LoadingOverlay(),
              ),
            ],
          );
        },
      ),
    );
  }

  // Widget _buildQuickStatsSection(BuildContext context) {
  //   return Container(
  //     padding: EdgeInsets.all(20.w),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(16.r),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.black.withValues(alpha: 0.05),
  //           spreadRadius: 0,
  //           blurRadius: 10,
  //           offset: const Offset(0, 2),
  //         ),
  //       ],
  //     ),
  //     child: Row(
  //       children: [
  //         Expanded(
  //           child: _buildStatItem(
  //             context,
  //             icon: Icons.access_time,
  //             title: 'work_hours'.tr,
  //             value: '8h 30m',
  //             color: LightColors.primaryColor,
  //           ),
  //         ),
  //         SizedBox(width: 16.w),
  //         Expanded(
  //           child: _buildStatItem(
  //             context,
  //             icon: Icons.check_circle,
  //             title: 'attendance'.tr,
  //             value: '95%',
  //             color: LightColors.greenColor,
  //           ),
  //         ),
  //         SizedBox(width: 16.w),
  //         Expanded(
  //           child: _buildStatItem(
  //             context,
  //             icon: Icons.trending_up,
  //             title: 'efficiency'.tr,
  //             value: '92%',
  //             color: LightColors.yelloColor,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildStatItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(icon, color: color, size: 24.sp),
        ),
        SizedBox(height: 8.h),
        Text(
          value,
          style: AppTextStyles.bold(
            context,
          ).copyWith(fontSize: 16.sp, color: LightColors.textColor),
        ),
        SizedBox(height: 2.h),
        Text(
          title,
          style: AppTextStyles.regular(
            context,
          ).copyWith(fontSize: 12.sp, color: LightColors.darkGreyColor),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildSectionHeader(
    BuildContext context, {
    required String title,
    String? trailing,
    bool showTrailing = true,
    VoidCallback? onTap,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.bold(
              context,
            ).copyWith(fontSize: 20.sp, color: LightColors.textColor),
          ),
          if (showTrailing && trailing != null)
            GestureDetector(
              onTap: onTap,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: LightColors.primaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      trailing,
                      style: AppTextStyles.medium(context).copyWith(
                        color: LightColors.primaryColor,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 12.sp,
                      color: LightColors.primaryColor,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
