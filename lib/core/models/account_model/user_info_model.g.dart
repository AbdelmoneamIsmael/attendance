// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoModel _$UserInfoModelFromJson(Map<String, dynamic> json) =>
    UserInfoModel(
      message: json['message'] as String?,
      isAuthenticated: json['isAuthenticated'] as bool?,
      id: (json['id'] as num?)?.toInt(),
      username: json['username'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      deviceToken: json['deviceToken'] as String?,
      imageUrl: json['imageUrl'] as String?,
      token: json['token'] as String?,
      expiresOn: json['expiresOn'] == null
          ? null
          : DateTime.parse(json['expiresOn'] as String),
      refreshToken: json['refreshToken'] as String?,
      refreshTokenExpiration: json['refreshTokenExpiration'] == null
          ? null
          : DateTime.parse(json['refreshTokenExpiration'] as String),
      statusCode: (json['statusCode'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UserInfoModelToJson(UserInfoModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'isAuthenticated': instance.isAuthenticated,
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'deviceToken': instance.deviceToken,
      'imageUrl': instance.imageUrl,
      'token': instance.token,
      'expiresOn': instance.expiresOn?.toIso8601String(),
      'refreshToken': instance.refreshToken,
      'refreshTokenExpiration':
          instance.refreshTokenExpiration?.toIso8601String(),
      'statusCode': instance.statusCode,
    };
