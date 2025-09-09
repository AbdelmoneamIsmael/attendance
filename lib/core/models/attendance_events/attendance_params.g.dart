// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceParams _$AttendanceParamsFromJson(Map<String, dynamic> json) =>
    AttendanceParams(
      isPagingEnabled: json['isPagingEnabled'] as bool?,
      pageIndex: json['pageIndex'] as num?,
      pageSize: json['pageSize'] as num?,
      sortColumn: json['sortColumn'] as String?,
      sortDirection: json['sortDirection'] as String?,
      search: json['search'] as String?,
      readDto: json['readDto'] == null
          ? null
          : AttendReadDto.fromJson(json['readDto'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AttendanceParamsToJson(AttendanceParams instance) =>
    <String, dynamic>{
      'isPagingEnabled': instance.isPagingEnabled,
      'pageIndex': instance.pageIndex,
      'pageSize': instance.pageSize,
      'sortColumn': instance.sortColumn,
      'sortDirection': instance.sortDirection,
      'search': instance.search,
      'readDto': instance.readDto,
    };

AttendReadDto _$AttendReadDtoFromJson(Map<String, dynamic> json) =>
    AttendReadDto(
      id: (json['id'] as num?)?.toInt(),
      employeeId: json['employeeId'] as num?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$AttendReadDtoToJson(AttendReadDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'employeeId': instance.employeeId,
      'date': instance.date?.toIso8601String(),
    };
