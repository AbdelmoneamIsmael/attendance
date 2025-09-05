import 'package:attendance/core/models/search_employee/response_model/employee_search_response_model.dart';
import 'package:attendance/core/routes/pages_keys.dart';
import 'package:attendance/core/widgets/avatar_view.dart';
import 'package:attendance/core/widgets/cashed_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PersonManageOnList extends StatelessWidget {
  const PersonManageOnList({super.key, required this.employees});
  final List<EmployeeCardEntity> employees;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10).w,
      sliver: SliverList.separated(
        itemBuilder: (context, index) => ListTile(
          onTap: () =>
              Get.toNamed("${PageKeys.profileScreen}/${employees[index].id}"),
          contentPadding: const EdgeInsets.all(14).w,
          leading: employees[index].imageUrl != null
              ? CachedImage(
                  height: 60.r,
                  width: 60.r,
                  radius: 50.r,
                  elevation: 2,
                  url: employees[index].imageUrl!,
                )
              : AvatarView(name: employees[index].name ?? "AI", raduis: 25.r),
          isThreeLine: true,
          title: Text(
            employees[index].name ?? "AI",
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                employees[index].jobGrade ?? "AI",
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(
                "${"work_time".tr} ${"from".tr} ${employees[index].startTime} ${"to".tr} ${employees[index].endTime}",
              ),
            ],
          ),
          subtitleTextStyle: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.circle,
                color: employees[index].iAttend! ? Colors.green : Colors.red,
              ),
              employees[index].isManager == true
                  ? const Icon(Icons.groups_2_outlined)
                  : const SizedBox(),
            ],
          ),
          tileColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemCount: employees.isEmpty ? 0 : employees.length,
      ),
    );
  }
}
