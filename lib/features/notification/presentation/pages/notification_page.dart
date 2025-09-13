import 'dart:math';

import 'package:attendance/core/widgets/no_data_widget.dart';
import 'package:attendance/features/notification/domain/entities/notification_entity.dart';
import 'package:attendance/features/notification/presentation/controller/notification_controller.dart';
import 'package:attendance/features/notification/presentation/widgets/notification_widget.dart';
import 'package:attendance/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationPage extends GetView<NotificationController> {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('notification'.tr)),

      body: GetBuilder<NotificationController>(
        builder: (_) {
          if (controller.isFirstLoad == true) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (controller.isLoading == false &&
              controller.notifications.isEmpty) {
            return Center(
              child: NoDataWidget(
                iconPath: Assets.icons.noNotification,
                title: "",
                description: 'no_notification'.tr,
              ),
            );
          } else {
            return RefreshIndicator(
              onRefresh: controller.refreshNotification,
              child: CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                controller: controller.scrollController,
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.all(22),
                    sliver: SliverList.separated(
                      itemBuilder: (context, index) {
                        NotificationEntity notification =
                            controller.notifications[index];
                        return NotificationWidget(notification: notification);
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 10);
                      },
                      itemCount: controller.notifications.length,
                    ),
                  ),
                  if (controller.isLoading == true)
                    const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                      ),
                    ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
