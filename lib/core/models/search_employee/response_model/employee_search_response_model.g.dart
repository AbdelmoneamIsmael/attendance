// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_search_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeSearchResult _$EmployeeSearchResultFromJson(
        Map<String, dynamic> json) =>
    EmployeeSearchResult(
      pageIndex: json['pageIndex'] as num?,
      pageSize: json['pageSize'] as num?,
      count: json['count'] as num?,
      pagesCount: json['pagesCount'] as num?,
      itemsCount: json['itemsCount'] as num?,
      hasPreviousPage: json['hasPreviousPage'] as bool?,
      hasNextPage: json['hasNextPage'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => EmployeeCardEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EmployeeSearchResultToJson(
        EmployeeSearchResult instance) =>
    <String, dynamic>{
      'pageIndex': instance.pageIndex,
      'pageSize': instance.pageSize,
      'count': instance.count,
      'pagesCount': instance.pagesCount,
      'itemsCount': instance.itemsCount,
      'hasPreviousPage': instance.hasPreviousPage,
      'hasNextPage': instance.hasNextPage,
      'data': instance.data,
    };

EmployeeCardEntity _$EmployeeCardEntityFromJson(Map<String, dynamic> json) =>
    EmployeeCardEntity(
      iAttend: json['iAttend'] as bool?,
      endTime: json['endTime'] as String?,
      startTime: json['startTime'] as String?,
      shiftName: json['shiftName'] as String?,
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      hireDate: json['hireDate'] == null
          ? null
          : DateTime.parse(json['hireDate'] as String),
      baseSalary: json['baseSalary'] as num?,
      attendType: json['attendType'] as String?,
      jobNumber: json['jobNumber'] as String?,
      jobGrade: json['jobGrade'] as String?,
      shift: json['shift'] as String?,
      employeeType: json['employeeType'] as String?,
      address: json['address'] as String?,
      gender: json['gender'] as num?,
      imageUrl: json['imageUrl'] as String?,
      isManager: json['isManager'] as bool?,
      employeesCount: json['employeesCount'] as num?,
    );

Map<String, dynamic> _$EmployeeCardEntityToJson(EmployeeCardEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'hireDate': instance.hireDate?.toIso8601String(),
      'baseSalary': instance.baseSalary,
      'attendType': instance.attendType,
      'jobNumber': instance.jobNumber,
      'jobGrade': instance.jobGrade,
      'shift': instance.shift,
      'employeeType': instance.employeeType,
      'address': instance.address,
      'gender': instance.gender,
      'imageUrl': instance.imageUrl,
      'endTime': instance.endTime,
      'startTime': instance.startTime,
      'shiftName': instance.shiftName,
      'isManager': instance.isManager,
      'employeesCount': instance.employeesCount,
      'iAttend': instance.iAttend,
    };
