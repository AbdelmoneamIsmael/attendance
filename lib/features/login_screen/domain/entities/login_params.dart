import 'package:json_annotation/json_annotation.dart';
part 'login_params.g.dart';
@JsonSerializable()
class LoginParams {
   String username;
   String password;
   String deviceToken;
   String deviceId;
   String longitude;
   String latitude;

  LoginParams({required this.username, required this.password, required this.deviceToken, required this.deviceId, required this.longitude, required this.latitude});

  Map<String, dynamic> toJson() => _$LoginParamsToJson(this);
}