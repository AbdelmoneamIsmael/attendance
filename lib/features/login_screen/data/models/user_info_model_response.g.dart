// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoModelResponse _$UserInfoModelResponseFromJson(
        Map<String, dynamic> json) =>
    UserInfoModelResponse(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : UserInfoModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      statusCode: json['statusCode'] as num?,
      error: json['error'],
    );

Map<String, dynamic> _$UserInfoModelResponseToJson(
        UserInfoModelResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
      'statusCode': instance.statusCode,
      'error': instance.error,
    };
