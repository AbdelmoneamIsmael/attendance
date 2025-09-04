import 'package:attendance/core/const/end_points.dart';
import 'package:attendance/core/models/account_model/employee_info.dart';
import 'package:attendance/core/models/search_employee/response_model/employee_search_response_model.dart';
import 'package:attendance/features/login_screen/data/models/employee_information_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'employee_repo_remote_data.g.dart';

abstract class EmployeeRepoRemoteData {
  Future<EmployeeInformationResponse> getEmployeeInfoById(int id);

  Future<EmployeeSearchResult> getSubEmployeesData(
    Map<String, dynamic> searchParams,
  );
}

@RestApi()
abstract class EmployeeRepoRemoteDataImple implements EmployeeRepoRemoteData {
    factory EmployeeRepoRemoteDataImple(Dio dio, {String baseUrl}) =
      _EmployeeRepoRemoteDataImple;
  @override
  @GET(AppEndPoints.getEmployeeInfo)
  Future<EmployeeInformationResponse> getEmployeeInfoById(@Query("UserId") int userId);

  @override
  @POST(AppEndPoints.getSubEmployees)
  Future<EmployeeSearchResult> getSubEmployeesData(
    @Body() Map<String, dynamic> searchParams,
  );
}
