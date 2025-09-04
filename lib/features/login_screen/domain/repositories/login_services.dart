import 'package:attendance/core/errors/error_class.dart';
import 'package:attendance/core/models/account_model/employee_info.dart';
import 'package:attendance/core/models/account_model/user_info_model.dart';
import 'package:attendance/features/login_screen/domain/entities/login_params.dart';
import 'package:dartz/dartz.dart';

abstract class LoginServices {
  Future<Either<Failure, UserInfoModel>> login({
    required LoginParams loginParams,
  });
  Future<Either<Failure, EmployeeInformation>> getLoginEmployeeInfo({
    required int userID,
  });
}
