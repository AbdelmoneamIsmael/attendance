import 'package:attendance/core/models/account_model/user_info_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_info_model_response.g.dart';

@JsonSerializable()
class UserInfoModelResponse {
  UserInfoModelResponse({
    required this.success,
    required this.data,
    required this.message,
    required this.statusCode,
    required this.error,
  });

  final bool? success;
  final UserInfoModel? data;
  final String? message;
  final num? statusCode;
  final dynamic error;

  UserInfoModelResponse copyWith({
    bool? success,
    UserInfoModel? data,
    String? message,
    num? statusCode,
    dynamic error,
  }) {
    return UserInfoModelResponse(
      success: success ?? this.success,
      data: data ?? this.data,
      message: message ?? this.message,
      statusCode: statusCode ?? this.statusCode,
      error: error ?? this.error,
    );
  }

  factory UserInfoModelResponse.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoModelResponseToJson(this);

  @override
  String toString() {
    return "$success, $data, $message, $statusCode, $error, ";
  }
}



/*
{
	"success": true,
	"data": {
		"message": "",
		"isAuthenticated": true,
		"id": 4,
		"username": "abdo",
		"email": "gifufa@mailinator.com",
		"phoneNumber": null,
		"deviceToken": "w",
		"imageUrl": null,
		"token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VyTmFtZSI6ImFiZG8iLCJqdGkiOiI0NGY1ZTJjZS1kZTgzLTRhNzItOThkOS05YTg3NmRiMjg0NDIiLCJVc2VySWQiOiI0IiwiZXhwIjoxNzU3MzU2ODIwLCJpc3MiOiJTZWN1cmVBcGkiLCJhdWQiOiJTZWN1cmVBcGlVc2VyIn0.qWI2RIYW4Tj7eHtZzCMORY39J_SoshYUltDF7Hgd7po",
		"expiresOn": "2025-09-08T18:40:20Z",
		"refreshToken": "dcFXUmTky4d8i3kkE2K6tJBC84AxeVSxl9XmxixUcwo=",
		"refreshTokenExpiration": "2025-09-05T14:34:56.265434",
		"statusCode": null
	},
	"message": "Success",
	"statusCode": 200,
	"error": null
}*/
