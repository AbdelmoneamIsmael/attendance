import 'package:attendance/core/models/search_employee/response_model/employee_search_response_model.dart';
import 'package:attendance/core/routes/pages_keys.dart';
import 'package:attendance/core/themes/colors/colors.dart';
import 'package:attendance/core/themes/styles/app_text_style.dart';
import 'package:attendance/core/widgets/avatar_view.dart';
import 'package:attendance/core/widgets/attatchements/cashed_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/// ويدجت لعرض قائمة الموظفين في شكل صفوف وأعمدة
/// Widget for displaying employee list in rows and columns format
class PersonManageOnList extends StatelessWidget {
  const PersonManageOnList({super.key, required this.employees});
  final List<EmployeeCardEntity> employees;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      // إضافة المسافات الخارجية للقائمة
      // Adding outer padding for the list
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      sliver: SliverList.separated(
        itemBuilder: (context, index) => GestureDetector(
          // إضافة وظيفة النقر للانتقال لصفحة الملف الشخصي
          // Adding tap functionality to navigate to profile page
          onTap: () =>
              Get.toNamed("${PageKeys.profileScreen}/${employees[index].id}"),
          child: Container(
            // إضافة المسافات الداخلية لكل عنصر
            // Adding inner margins for each item
            margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              // إضافة الظل للعنصر
              // Adding shadow to the element
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  spreadRadius: 0,
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Row(
                children: [
                  // القسم الأول: صورة الموظف أو الحرف الأول من الاسم
                  // First section: Employee image or first letter of name
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // إضافة ظل للصورة
                      // Adding shadow to the image
                      boxShadow: [
                        BoxShadow(
                          color: LightColors.primaryColor.withValues(
                            alpha: 0.2,
                          ),
                          spreadRadius: 0,
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: employees[index].imageUrl != null
                        ? CachedImage(
                            height: 50.w,
                            width: 50.w,
                            radius: 50.w,
                            elevation: 0,
                            url: employees[index].imageUrl!,
                          )
                        : AvatarView(
                            name: employees[index].name ?? "AI",
                            raduis: 25.w,
                          ),
                  ),
                  SizedBox(width: 16.w),
                  // القسم الثاني: المحتوى الرئيسي (الاسم والتفاصيل)
                  // Second section: Main content (name and details)
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // اسم الموظف
                          // Employee name
                          Text(
                            employees[index].name ?? "AI",
                            style: AppTextStyles.semiBold(context).copyWith(
                              fontSize: 16.sp,
                              color: LightColors.textColor,
                            ),
                          ),
                          SizedBox(height: 4.h),

                          // الدرجة الوظيفية
                          // Job grade
                          Text(
                            employees[index].jobGrade ?? "AI",
                            style: AppTextStyles.medium(context).copyWith(
                              fontSize: 14.sp,
                              color: LightColors.darkGreyColor,
                            ),
                          ),
                          SizedBox(height: 2.h),

                          // ساعات العمل
                          // Work hours
                          Text(
                            "${"work_time".tr} ${"from".tr} ${employees[index].startTime} ${"to".tr} ${employees[index].endTime}",
                            style: AppTextStyles.regular(context).copyWith(
                              fontSize: 12.sp,
                              color: LightColors.greyColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // القسم الثالث: مؤشرات الحالة (الحضور ومدير)
                  // Third section: Status indicators (attendance and manager)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // مؤشر الحضور (أخضر للحاضر، أحمر للغائب)
                      // Attendance indicator (green for present, red for absent)
                      Container(
                        padding: EdgeInsets.all(4.w),
                        decoration: BoxDecoration(
                          color: employees[index].iAttend!
                              ? LightColors.greenColor.withValues(alpha: 0.1)
                              : LightColors.redColor.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.circle,
                          color: employees[index].iAttend!
                              ? LightColors.greenColor
                              : LightColors.redColor,
                          size: 12.sp,
                        ),
                      ),
                      // مؤشر المدير (يظهر فقط إذا كان الموظف مدير)
                      // Manager indicator (shows only if employee is a manager)
                      if (employees[index].isManager == true) ...[
                        SizedBox(height: 4.h),
                        Container(
                          padding: EdgeInsets.all(4.w),
                          decoration: BoxDecoration(
                            color: LightColors.primaryColor.withValues(
                              alpha: 0.1,
                            ),
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: Icon(
                            Icons.groups_2_outlined,
                            color: LightColors.primaryColor,
                            size: 16.sp,
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        // إضافة مسافة بين العناصر
        // Adding spacing between items
        separatorBuilder: (context, index) => SizedBox(height: 8.h),
        // عدد العناصر في القائمة
        // Number of items in the list
        itemCount: employees.isEmpty ? 0 : employees.length,
      ),
    );
  }
}
