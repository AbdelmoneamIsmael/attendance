// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginParams _$LoginParamsFromJson(Map<String, dynamic> json) => LoginParams(
      username: json['username'] as String,
      password: json['password'] as String,
      deviceToken: json['deviceToken'] as String,
      deviceId: json['deviceId'] as String,
      longitude: json['longitude'] as String,
      latitude: json['latitude'] as String,
    );

Map<String, dynamic> _$LoginParamsToJson(LoginParams instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'deviceToken': instance.deviceToken,
      'deviceId': instance.deviceId,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
    };
