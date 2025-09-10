// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeInformation _$EmployeeInformationFromJson(Map<String, dynamic> json) =>
    EmployeeInformation(
      employeeView: json['employeeView'] == null
          ? null
          : EmployeeView.fromJson(json['employeeView'] as Map<String, dynamic>),
      shiftView: json['shiftView'] == null
          ? null
          : ShiftView.fromJson(json['shiftView'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EmployeeInformationToJson(
        EmployeeInformation instance) =>
    <String, dynamic>{
      'employeeView': instance.employeeView,
      'shiftView': instance.shiftView,
    };

EmployeeView _$EmployeeViewFromJson(Map<String, dynamic> json) => EmployeeView(
      isManager: json['isManager'] as bool?,
      employeesCount: json['employeesCount'] as num?,
      imageUrl: json['imageUrl'] as String?,
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      hireDate: json['hireDate'] as String?,
      baseSalary: json['baseSalary'] as num?,
      attendType: json['attendType'] as String?,
      jobNumber: json['jobNumber'] as String?,
      jobGrade: json['jobGrade'],
      shift: json['shift'] as String?,
      employeeType: json['employeeType'],
      address: json['address'] as String?,
      gender: json['gender'] as num?,
    );

Map<String, dynamic> _$EmployeeViewToJson(EmployeeView instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'hireDate': instance.hireDate,
      'baseSalary': instance.baseSalary,
      'attendType': instance.attendType,
      'jobNumber': instance.jobNumber,
      'jobGrade': instance.jobGrade,
      'shift': instance.shift,
      'employeeType': instance.employeeType,
      'address': instance.address,
      'gender': instance.gender,
      'imageUrl': instance.imageUrl,
      'isManager': instance.isManager,
      'employeesCount': instance.employeesCount,
    };

ShiftView _$ShiftViewFromJson(Map<String, dynamic> json) => ShiftView(
      start: DateTime.parse(json['start'] as String),
      end: DateTime.parse(json['end'] as String),
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      requiredHours: json['requiredHours'] as num?,
      graceInMinutes: json['graceInMinutes'] as num?,
      graceOutMinutes: json['graceOutMinutes'] as num?,
    );

Map<String, dynamic> _$ShiftViewToJson(ShiftView instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'start': instance.start.toIso8601String(),
      'end': instance.end.toIso8601String(),
      'requiredHours': instance.requiredHours,
      'graceInMinutes': instance.graceInMinutes,
      'graceOutMinutes': instance.graceOutMinutes,
    };
