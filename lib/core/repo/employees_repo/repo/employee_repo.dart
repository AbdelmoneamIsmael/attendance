import 'package:attendance/core/errors/error_class.dart';
import 'package:attendance/core/models/account_model/employee_info.dart';
import 'package:attendance/core/models/search_employee/params/search_employee_params.dart';
import 'package:attendance/core/models/search_employee/response_model/employee_search_response_model.dart';
import 'package:dartz/dartz.dart';

abstract class EmployeeRepo {
  Future<Either<Failure, EmployeeInformation>> getEmployeeInfoById({
    required int employeeId
  });
  Future<Either<Failure, EmployeeSearchResult>> getSubEmplyees({
    required SearchParams searchParams,
  });

}