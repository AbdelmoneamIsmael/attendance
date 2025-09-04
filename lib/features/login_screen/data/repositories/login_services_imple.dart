import 'package:attendance/core/errors/error_class.dart';
import 'package:attendance/core/models/account_model/employee_info.dart';
import 'package:attendance/core/models/account_model/user_info_model.dart';
import 'package:attendance/features/login_screen/data/datasources/remote_login_data_source.dart';
import 'package:attendance/features/login_screen/domain/entities/login_params.dart';
import 'package:attendance/features/login_screen/domain/repositories/login_services.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class LoginServicesImple extends LoginServices {
  final RemoteLoginDataSource remoteLoginDataSource;

  LoginServicesImple({required this.remoteLoginDataSource});
  @override
  Future<Either<Failure, EmployeeInformation>> getLoginEmployeeInfo({
    required int userID,
  }) async {
    try {
      var results = await remoteLoginDataSource.getLoginEmployeeInfo(userID);
      return Right(results.empoyeeInfo!);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserInfoModel>> login({
    required LoginParams loginParams,
  }) async {
    try {
      var results = await remoteLoginDataSource.getToken(loginParams.toJson());
      return Right(results.data!);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
