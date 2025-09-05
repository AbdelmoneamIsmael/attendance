import 'package:attendance/core/models/account_model/employee_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'employee_information_response.g.dart';

@JsonSerializable()
class EmployeeInformationResponse {
  EmployeeInformationResponse({
    required this.success,
    required this.empoyeeInfo,
    required this.message,
    required this.statusCode,
    required this.error,
  });

  final bool? success;
  @JsonKey(name: 'data')
  final EmployeeInformation empoyeeInfo;
  final String? message;
  final num? statusCode;
  final dynamic error;

  EmployeeInformationResponse copyWith({
    bool? success,
     EmployeeInformation? data,
    String? message,
    num? statusCode,
    dynamic error,
  }) {
    return EmployeeInformationResponse(
      success: success ?? this.success,
      empoyeeInfo: data ?? empoyeeInfo,
      message: message ?? this.message,
      statusCode: statusCode ?? this.statusCode,
      error: error ?? this.error,
    );
  }

  factory EmployeeInformationResponse.fromJson(Map<String, dynamic> json) =>
      _$EmployeeInformationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeInformationResponseToJson(this);

  @override
  String toString() {
    return "$success, $empoyeeInfo, $message, $statusCode, $error, ";
  }
}
