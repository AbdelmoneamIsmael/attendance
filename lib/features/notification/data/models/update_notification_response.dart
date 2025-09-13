import 'package:attendance/features/notification/data/models/notification_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_notification_response.g.dart';

@JsonSerializable()
class NotificationUpdateModel {
  NotificationUpdateModel({
    required this.success,
    required this.data,
    required this.message,
    required this.statusCode,
    required this.error,
  });

  final bool? success;
  final AppNotificationModel? data;
  final String? message;
  final num? statusCode;
  final dynamic error;

  NotificationUpdateModel copyWith({
    bool? success,
    AppNotificationModel? data,
    String? message,
    num? statusCode,
    dynamic? error,
  }) {
    return NotificationUpdateModel(
      success: success ?? this.success,
      data: data ?? this.data,
      message: message ?? this.message,
      statusCode: statusCode ?? this.statusCode,
      error: error ?? this.error,
    );
  }

  factory NotificationUpdateModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationUpdateModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationUpdateModelToJson(this);

  @override
  String toString() {
    return "$success, $data, $message, $statusCode, $error, ";
  }
}

