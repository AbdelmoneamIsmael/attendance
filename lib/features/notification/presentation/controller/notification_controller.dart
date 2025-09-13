import 'package:attendance/core/widgets/ui_helper.dart';
import 'package:attendance/features/notification/data/models/notification_params.dart';
import 'package:attendance/features/notification/data/models/notification_response_model.dart';
import 'package:attendance/features/notification/domain/entities/notification_entity.dart';
import 'package:attendance/features/notification/domain/repositories/notification_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  NotificationRepo notificationRepo = Get.find<NotificationRepo>();
  //pagination
  bool isFirstLoad = true;
  int pageIndex = 1;
  final ScrollController scrollController = ScrollController();
  var isThereMoreItems = true;
  bool isLoading = false;
  int pageSize = 20;
  NotificationResponseModel? attendanceResults;
  List<NotificationEntity> notifications = [];

  @override
  void onInit() {
    getAllNotifications().then((value) => initscrollPagenation());
    super.onInit();
  }

  void _onScroll() {
    if (scrollController.hasClients) {
      double currentPosition = scrollController.position.pixels;
      double maxScrollExtent = scrollController.position.maxScrollExtent;
      double seventyPercentOffset = maxScrollExtent * 0.7;

      if (currentPosition >= seventyPercentOffset &&
          !isLoading &&
          isThereMoreItems) {
        getAllNotifications();
      }
    }
  }

  void initscrollPagenation() {
    scrollController.addListener(_onScroll);
  }

  Future<void> getAllNotifications() async {
    isLoading = true;

    NotificationParams notificationParams = NotificationParams(
      isPagingEnabled: true,
      pageIndex: pageIndex,
      pageSize: pageSize,
      sortColumn: "id",
      sortDirection: "desc",
      search: "",
      readDto: null,
    );
    var results = await notificationRepo.getNotificattion(
      notificationParams: notificationParams,
    );
    results.fold(
      (l) {
        isLoading = false;
        isFirstLoad = false;
        isThereMoreItems = false;
        UIHelper.showSnakBar(message: l.message);
        update();
      },
      (r) {
        print(r.toString());
        print("lenth attendance${r.data?.length}");
        attendanceResults = r;
        notifications.addAll(r.data ?? []);
        isThereMoreItems = r.hasNextPage ?? false;
        pageIndex++;
        isLoading = false;
        isFirstLoad = false;

        update();
      },
    );
  }

  Future<void> refreshNotification() async {
    pageIndex = 1;

    isThereMoreItems = true;
    notifications.clear();
    await getAllNotifications();
  }

  Future<void> updateNotificationStatus(NotificationEntity notification) async {
    var result = await notificationRepo.updateNotificationStatus(notification);
    result.fold(
      (l) {
        UIHelper.showSnakBar(message: l.message);
        update();
      },
      (r) {
        notification.isRead = r.isRead ?? true;
        update();
      },
    );
  }
}
