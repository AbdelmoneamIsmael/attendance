import 'package:attendance/core/const/enums.dart';
import 'package:attendance/core/errors/error_class.dart';
import 'package:attendance/core/models/account_model/employee_info.dart';
import 'package:attendance/core/models/attendance_events/attendance_params.dart';
import 'package:attendance/core/models/attendance_events/attendance_response_model.dart';
import 'package:attendance/core/models/search_employee/params/search_employee_params.dart';
import 'package:attendance/core/models/search_employee/response_model/employee_search_response_model.dart';
import 'package:attendance/core/repo/employees_repo/data/employee_repo_remote_data.dart';
import 'package:attendance/core/repo/employees_repo/repo/employee_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class GetEmployeeRepoImple extends EmployeeRepo {
  final EmployeeRepoRemoteData employeeRepoRemoteData;

  GetEmployeeRepoImple({required this.employeeRepoRemoteData});

  @override
  Future<Either<Failure, EmployeeInformation>> getEmployeeInfoById({
    required int employeeId,
  }) async {
    try {
      var results = await employeeRepoRemoteData.getEmployeeInfoById(
        employeeId,
      );
      return Right(results.empoyeeInfo);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, EmployeeSearchResult>> getSubEmplyees({
    required SearchParams searchParams,
  }) async {
    try {
      var results = await employeeRepoRemoteData.getSubEmployeesData(
        searchParams.toJson(),
      );
      return Right(results);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AttendanceResponseModel>> getEmployeeAttendances({
    required AttendanceParams attendanceParams,
  }) async {
    try {
      var results = await employeeRepoRemoteData.getEmployeeAttendances(
        attendanceParams.toJson(),
      );
      return Right(results);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> signAttendIn({
    required AttendanceType attendanceType,
    required int shiftId,
  }) async {
    try {
      final json = {
        "attendanceType": attendanceType.index,
        "shiftId": shiftId,
        "date": DateTime.now().toIso8601String(),
      };
      print(json);
      var results = await employeeRepoRemoteData.addAttend(json);
      return Right(results);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
