import 'package:attendance/core/errors/error_class.dart';
import 'package:attendance/features/notification/data/datasources/get_notification_remote_repo.dart';
import 'package:attendance/features/notification/data/models/notification_params.dart';
import 'package:attendance/features/notification/data/models/notification_response_model.dart';
import 'package:attendance/features/notification/domain/repositories/notification_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class NotificattionRepoImplement extends NotificationRepo {
  final GetNotificationRemoteRepo getNotificationRemoteRepo;

  NotificattionRepoImplement({required this.getNotificationRemoteRepo});
  @override
  Future<Either<Failure, NotificationResponseModel>> getNotificattion({
    required NotificationParams notificationParams,
  }) async {
    try {
      final result = await getNotificationRemoteRepo.getNotificattion(
        notificationParams.toJson(),
      );
      return Right(result);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
