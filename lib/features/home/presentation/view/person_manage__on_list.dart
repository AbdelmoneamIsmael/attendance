import 'package:attendance/core/widgets/cashed_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PersonManageOnList extends StatelessWidget {
  const PersonManageOnList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10).w,
      sliver: SliverList.separated(
        itemBuilder: (context, index) => ListTile(
          contentPadding: const EdgeInsets.all(14).w,
          leading: const CachedImage(
            height: 60,
            width: 60,
            radius: 50,
            elevation: 2,
            url:
                "https://cdn.prod.website-files.com/5fbb9b89508062592a9731b1/6448c1ce35d6ffe59e4d6f46_GettyImages-1399565382.jpg",
          ),
          isThreeLine: true,
          title: const Text("Abdelmoneam Ismael"),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Flutter Developer"),
              Text("${"work_time".tr} ${"from".tr} 5:00 PM ${"to".tr} 6:00 PM"),
            ],
          ),
          subtitleTextStyle: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
          trailing: Icon(
            Icons.circle,
            color: index == 2 ? Colors.red : Colors.green,
          ),
          tileColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemCount: 10,
      ),
    );
  }
}
