import 'package:attendance/core/errors/error_class.dart';
import 'package:attendance/features/notification/data/models/notification_params.dart';
import 'package:attendance/features/notification/data/models/notification_response_model.dart';
import 'package:attendance/features/notification/domain/entities/notification_entity.dart';
import 'package:dartz/dartz.dart';

abstract class NotificationRepo {
  Future<Either<Failure,NotificationResponseModel>> getNotificattion({
    required NotificationParams notificationParams
  });

  Future<Either<Failure,NotificationEntity>> updateNotificationStatus(NotificationEntity notification);
}