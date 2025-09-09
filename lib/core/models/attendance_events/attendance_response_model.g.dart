// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceResponseModel _$AttendanceResponseModelFromJson(
        Map<String, dynamic> json) =>
    AttendanceResponseModel(
      pageIndex: json['pageIndex'] as num?,
      pageSize: json['pageSize'] as num?,
      count: json['count'] as num?,
      pagesCount: json['pagesCount'] as num?,
      itemsCount: json['itemsCount'] as num?,
      hasPreviousPage: json['hasPreviousPage'] as bool?,
      hasNextPage: json['hasNextPage'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DateEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AttendanceResponseModelToJson(
        AttendanceResponseModel instance) =>
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

DateEvent _$DateEventFromJson(Map<String, dynamic> json) => DateEvent(
      id: json['id'] as num?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      attendances: (json['attendances'] as List<dynamic>?)
          ?.map((e) => AttendanceEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DateEventToJson(DateEvent instance) => <String, dynamic>{
      'id': instance.id,
      'date': instance.date?.toIso8601String(),
      'attendances': instance.attendances,
    };

AttendanceEvent _$AttendanceEventFromJson(Map<String, dynamic> json) =>
    AttendanceEvent(
      id: (json['id'] as num?)?.toInt(),
      employeeId: json['employeeId'] as num?,
      employeeName: json['employeeName'] as String?,
      shiftName: json['shiftName'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      checkIn: json['checkIn'] as String?,
      checkOut: json['checkOut'] as String?,
      actualHours: json['actualHours'] as num?,
      lateMinutes: json['lateMinutes'] as num?,
      earlyLeaveMinutes: json['earlyLeaveMinutes'] as num?,
      isAbsent: json['isAbsent'] as bool?,
      leaveName: json['leaveName'],
      attendanceType: json['attendanceType'] as num?,
    );

Map<String, dynamic> _$AttendanceEventToJson(AttendanceEvent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'employeeId': instance.employeeId,
      'employeeName': instance.employeeName,
      'shiftName': instance.shiftName,
      'date': instance.date?.toIso8601String(),
      'checkIn': instance.checkIn,
      'checkOut': instance.checkOut,
      'actualHours': instance.actualHours,
      'lateMinutes': instance.lateMinutes,
      'earlyLeaveMinutes': instance.earlyLeaveMinutes,
      'isAbsent': instance.isAbsent,
      'leaveName': instance.leaveName,
      'attendanceType': instance.attendanceType,
    };
