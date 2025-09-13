import 'package:attendance/core/const/end_points.dart';
import 'package:attendance/features/notification/data/models/notification_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'get_notification_remote_repo.g.dart';

abstract class GetNotificationRemoteRepo {
  Future<NotificationResponseModel> getNotificattion(
    Map<String,dynamic>  notificationParams,
  );
}

@RestApi()
abstract class GetNotificationRemoteRepoImple extends GetNotificationRemoteRepo {
  factory GetNotificationRemoteRepoImple(Dio dio) = _GetNotificationRemoteRepoImple;

  @override
  @POST(AppEndPoints.getNotifications)
  Future<NotificationResponseModel> getNotificattion(
    @Body() Map<String,dynamic>  notificationParams,
  );

}