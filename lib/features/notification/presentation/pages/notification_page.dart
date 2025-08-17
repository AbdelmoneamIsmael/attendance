import 'package:attendance/core/widgets/cashed_images.dart';
import 'package:attendance/features/notification/presentation/controller/notification_controller.dart';
import 'package:attendance/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class NotificationPage extends GetView<NotificationController> {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('notification'.tr)),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
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
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(Assets.icons.notification, width: 40),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "رساله تهنئه",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'بسم الله الرحمن الرحيم\nبمناسبة حلول عيد الأضحى المبارك، يسرّ إدارة  أن تتقدّم إليكم بخالص التهاني وأطيب الأمنيات، راجين من الله أن يعيده عليكم وعلى أسرِكم الكريمة بالخير واليمن والبركات.\nنسأل الله أن يتقبّل منّا ومنكم صالح الأعمال، وأن يجعل أيامكم مليئة بالسعادة والنجاح، وأن يوفقكم دائمًا لما فيه الخير.\nكل عام وأنتم بخير 🌸✨',
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '2023-01-01 2:26 PM',
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(height: 8),
                          CachedImage(
                            url:
                                "https://mediaaws.almasryalyoum.com/news/medium/2024/06/14/2417441_0.jpg",
                            width: 100,
                            height: 100,
                            radius: 20,
                            showImageOnTap: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
