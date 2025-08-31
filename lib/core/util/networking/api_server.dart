import 'dart:io';
import 'package:attendance/core/const/app_const.dart';
import 'package:attendance/core/const/storage_keys.dart';
import 'package:attendance/core/util/cache/cache_helper.dart';
import 'package:attendance/core/util/networking/api_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiServer extends ApiRepo {
  //singlton
  ApiServer._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: prodBaseURl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
      ),
    );
    addInterceptors();
  }

  factory ApiServer() {
    _instance ??= ApiServer._internal();

    return _instance!;
  }

  static ApiServer? _instance;
  Dio? _dio;

  void setDio(Dio dio) => _dio = dio;

  Dio get dio => _dio!;

  //----------------------------------------------------------------------------
  ///add interceptors
  void addInterceptors() {
    _dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          debugPrint(
            "----------------------------on request--------------------------",
          );
          String? token = await CacheHelper.getSecuerString(
            key: StorageKeys.accessToken,
          );
          options.headers["Authorization"] = "Bearer $token";
          options.headers["Accept-Language"] = "ar-EG";

          return handler.next(options);
        },
        onResponse: (response, handler) async {
          return handler.next(response);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 401 ||
              error.response?.statusCode == 403) {
            String token = await refreshToken();
            if (token.isNotEmpty) {
              error.requestOptions.headers["Authorization"] = "Bearer $token";

              try {
                final newResponse = await _dio!.fetch(error.requestOptions);
                return handler.resolve(newResponse);
              } catch (e) {
                // PageRoutes.router.go(PagesKeys.loginPage);
                return handler.next(error);
              }
            } else {
              // PageRoutes.router.go(PagesKeys.loginPage);
              return handler.next(error);
            }
          }

          return handler.next(error);
        },
      ),
    );
  }

  /// get request from api
  @override
  Future<Map<String, dynamic>> getRequest({
    required String uri,
    Map<String, String>? additionalHeaders,
  }) async {
    String url = "${prodBaseURl}$uri";

    _dio!.options.headers = additionalHeaders ?? {};

    Response response = await _dio!.get(url);
    if (response.data is! Map<String, dynamic>) {
      return {"data": response.data};
    }
    return response.data;
  }

  ///cheek internet connection

  @override
  Future<bool> cheekInterentConnection() async {
    try {
      final foo = await InternetAddress.lookup('google.com');
      return foo.isNotEmpty && foo[0].rawAddress.isNotEmpty ? true : false;
    } catch (e) {
      return false;
    }
  }

  /// post request from api
  @override
  Future<Map<String, dynamic>> post({
    required String endPoint,
    required Object? data,
    Map<String, String>? additionalHeaders,
  }) async {
    String url = "${prodBaseURl}$endPoint";
    _dio?.options.headers =
        additionalHeaders ?? {"Content-Type": "application/json"};
    var response = await _dio!.post(url, data: data);

    return response.data;
  }

  @override
  Future<Map<String, dynamic>> delete({
    required String endPoint,
    required Object? data,
    String? contentType,
  }) async {
    Map<String, String> headers = {};
    String token = await CacheHelper.getSecuerString(
      key: StorageKeys.accessToken,
    );
    headers.addAll({
      "Authorization": "Bearer $token",
      "Content-Type": contentType ?? "application/json",
    });
    String url = "${prodBaseURl}$endPoint";
    _dio?.options.headers = headers;
    var response = await _dio!.delete(url, data: data);
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> put({
    required String endPoint,
    required Object? data,
    String? contentType,
  }) async {
    String url = "${prodBaseURl}$endPoint";
    Map<String, String> headers = {
      "Content-Type": contentType ?? "application/json",
    };
    _dio?.options.headers = headers;
    var response = await _dio!.put(url, data: data);
    return response.data;
  }

  Future<String> refreshToken() async {
    try {
      String? accessToken = await CacheHelper.getSecuerString(
        key: StorageKeys.accessToken,
      );
      String refreshToken = await CacheHelper.getSecuerString(
        key: StorageKeys.refreshToken,
      );
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $accessToken",
        'Cookie': 'refreshToken=$refreshToken',
      };
      String url = "api/Authentication/RefreshToken";
      _dio?.options.headers = headers;
      var response = await _dio!.get(url);

      if (response.statusCode == 200) {
        await CacheHelper.setSecuerString(
          key: StorageKeys.accessToken,
          value: response.data["token"],
        );
        return response.data["token"];
      } else {
        await CacheHelper.setSecuerString(
          key: StorageKeys.accessToken,
          value: "",
        );
        await CacheHelper.setSecuerString(
          key: StorageKeys.refreshToken,
          value: "",
        );
        // PageRoutes.router.go(PagesKeys.loginPage);
        return "";
      }
    } on Exception catch (e) {
      debugPrint(e.toString());

      // PageRoutes.router.go(PagesKeys.loginPage);
      // rethrow;
      return "";
    }
  }

  // Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
  //   final options = Options(
  //     method: requestOptions.method,
  //     headers: requestOptions.headers,
  //   );
  //   return _dio!.request<dynamic>(
  //     requestOptions.path,
  //     data: requestOptions.data,
  //     queryParameters: requestOptions.queryParameters,
  //     options: options,
  //   );
  // }
}
