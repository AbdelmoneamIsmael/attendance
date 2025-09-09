import 'package:attendance/features/notification/domain/entities/notification_entity.dart';
import 'package:attendance/features/notification/presentation/controller/notification_controller.dart';
import 'package:attendance/features/notification/presentation/widgets/notification_widget.dart';
import 'package:flutter/material.dart';
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
          NotificationWidget(
            notification: NotificationEntity(
              title: "رساله تهنئه",
              body:
                  'بسم الله الرحمن الرحيم\nبمناسبة حلول عيد الأضحى المبارك، يسرّ إدارة  أن تتقدّم إليكم بخالص التهاني وأطيب الأمنيات، راجين من الله أن يعيده عليكم وعلى أسرِكم الكريمة بالخير واليمن والبركات.\nنسأل الله أن يتقبّل منّا ومنكم صالح الأعمال، وأن يجعل أيامكم مليئة بالسعادة والنجاح، وأن يوفقكم دائمًا لما فيه الخير.\nكل عام وأنتم بخير 🌸✨',
              date: DateTime.now(),
              attatchments: [
                "https://mediaaws.almasryalyoum.com/news/medium/2024/06/14/2417441_0.jpg",
                "https://www.adobe.com/support/products/enterprise/knowledgecenter/media/c4611_sample_explain.pdf",
                "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
              ],
            ),
          ),
        ],
      ),
    );
  }
}
