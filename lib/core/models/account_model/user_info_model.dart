import 'package:json_annotation/json_annotation.dart';

part 'user_info_model.g.dart';

@JsonSerializable()
class UserInfoModel {
  UserInfoModel({
    required this.message,
    required this.isAuthenticated,
    required this.id,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.deviceToken,
    required this.imageUrl,
    required this.token,
    required this.expiresOn,
    required this.refreshToken,
    required this.refreshTokenExpiration,
    required this.statusCode,
  });

   String? message;
   bool? isAuthenticated;
   int? id;
   String? username;
   String? email;
   String? phoneNumber;
   String? deviceToken;
   String? imageUrl;
   String? token;
   DateTime? expiresOn;
   String? refreshToken;
   DateTime? refreshTokenExpiration;
   int? statusCode;

  UserInfoModel copyWith({
    String? message,
    bool? isAuthenticated,
    int? id,
    String? username,
    String? email,
    dynamic? phoneNumber,
    String? deviceToken,
    dynamic? imageUrl,
    String? token,
    DateTime? expiresOn,
    String? refreshToken,
    DateTime? refreshTokenExpiration,
    dynamic? statusCode,
  }) {
    return UserInfoModel(
      message: message ?? this.message,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      deviceToken: deviceToken ?? this.deviceToken,
      imageUrl: imageUrl ?? this.imageUrl,
      token: token ?? this.token,
      expiresOn: expiresOn ?? this.expiresOn,
      refreshToken: refreshToken ?? this.refreshToken,
      refreshTokenExpiration:
          refreshTokenExpiration ?? this.refreshTokenExpiration,
      statusCode: statusCode ?? this.statusCode,
    );
  }

  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoModelToJson(this);

  @override
  String toString() {
    return "$message, $isAuthenticated, $id, $username, $email, $phoneNumber, $deviceToken, $imageUrl, $token, $expiresOn, $refreshToken, $refreshTokenExpiration, $statusCode, ";
  }
}

/*
{
	"message": "",
	"isAuthenticated": true,
	"id": 4,
	"username": "abdo",
	"email": "gifufa@mailinator.com",
	"phoneNumber": null,
	"deviceToken": "string",
	"imageUrl": null,
	"token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VyTmFtZSI6ImFiZG8iLCJqdGkiOiJhOTcwNGFiYS03ZDRjLTQxY2QtYjY5Yi03OWYwZGQzZjQ5NDUiLCJVc2VySWQiOiI0IiwiZXhwIjoxNzU2OTYwMjA2LCJpc3MiOiJTZWN1cmVBcGkiLCJhdWQiOiJTZWN1cmVBcGlVc2VyIn0.ioXC59YvKXmv8IAuCqOvjm7I0pU-c6NhIUkQVNBfmzU",
	"expiresOn": "2025-09-04T04:30:06Z",
	"refreshToken": "VWDeQ4LZkIqoqlpUe3vquDJ3h66dG8rGfEOLxD+1zRI=",
	"refreshTokenExpiration": "2025-08-31T19:07:12.6889737",
	"statusCode": null
}*/
