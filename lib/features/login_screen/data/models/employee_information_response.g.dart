// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_information_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeInformationResponse _$EmployeeInformationResponseFromJson(
        Map<String, dynamic> json) =>
    EmployeeInformationResponse(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : EmployeeInformation.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      statusCode: json['statusCode'] as num?,
      error: json['error'],
    );

Map<String, dynamic> _$EmployeeInformationResponseToJson(
        EmployeeInformationResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
      'statusCode': instance.statusCode,
      'error': instance.error,
    };
