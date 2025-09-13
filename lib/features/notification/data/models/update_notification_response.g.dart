// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_notification_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationUpdateModel _$NotificationUpdateModelFromJson(
        Map<String, dynamic> json) =>
    NotificationUpdateModel(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : AppNotificationModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      statusCode: json['statusCode'] as num?,
      error: json['error'],
    );

Map<String, dynamic> _$NotificationUpdateModelToJson(
        NotificationUpdateModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
      'statusCode': instance.statusCode,
      'error': instance.error,
    };
