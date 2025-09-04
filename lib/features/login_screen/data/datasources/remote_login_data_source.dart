import 'package:attendance/core/const/app_const.dart';
import 'package:attendance/core/const/end_points.dart';
import 'package:attendance/core/models/account_model/user_info_model.dart';
import 'package:attendance/features/login_screen/data/models/employee_information_response.dart';
import 'package:attendance/features/login_screen/data/models/user_info_model_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'remote_login_data_source.g.dart';

abstract class RemoteLoginDataSource {
  Future<UserInfoModelResponse> getToken(Map<String, dynamic> loginParamsJson);
  Future<EmployeeInformationResponse> getLoginEmployeeInfo(int userId);
}

@RestApi()
abstract class RemoteLoginDataSourceImple implements RemoteLoginDataSource {
  factory RemoteLoginDataSourceImple(Dio dio, {String baseUrl}) =
      _RemoteLoginDataSourceImple;

  @override
  @POST(AppEndPoints.getLogin)
  Future<UserInfoModelResponse> getToken(
    @Body() Map<String, dynamic> loginParamsJson,
  );

  @override
  @GET(AppEndPoints.getEmployeeInfo)
  Future<EmployeeInformationResponse> getLoginEmployeeInfo(
    @Query("UserId") int userId,
  );
}
