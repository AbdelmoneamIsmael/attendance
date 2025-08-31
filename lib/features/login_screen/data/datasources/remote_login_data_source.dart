import 'package:attendance/core/const/app_const.dart';
import 'package:attendance/core/const/end_points.dart';
import 'package:attendance/core/models/account_model/user_info_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'remote_login_data_source.g.dart';

abstract class RemoteLoginDataSource {
  Future<UserInfoModel> getToken(
     Map<String, dynamic> loginParamsJson,
  );
  // Future<UserInfoModel> getLoginEmployeeInfo();
}

@RestApi(baseUrl: prodBaseURl)
abstract class RemoteLoginDataSourceImple implements RemoteLoginDataSource {
  factory RemoteLoginDataSourceImple(Dio dio, {String baseUrl}) =
      _RemoteLoginDataSourceImple;

  @override
  @POST(AppEndPoints.getLogin)
  Future<UserInfoModel> getToken(@Body() Map<String, dynamic> loginParamsJson);

  // @override
  // Future<UserInfoModel> getLoginEmployeeInfo() {
  //   throw UnimplementedError();
  // }
}
