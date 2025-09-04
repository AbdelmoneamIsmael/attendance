// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_employee_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchParams _$SearchParamsFromJson(Map<String, dynamic> json) => SearchParams(
      isPagingEnabled: json['isPagingEnabled'] as bool?,
      pageIndex: json['pageIndex'] as num?,
      pageSize: json['pageSize'] as num?,
      sortColumn: json['sortColumn'] as String?,
      sortDirection: json['sortDirection'] as String?,
      search: json['search'] as String?,
      readDto: json['readDto'] == null
          ? null
          : ReadDto.fromJson(json['readDto'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchParamsToJson(SearchParams instance) =>
    <String, dynamic>{
      'isPagingEnabled': instance.isPagingEnabled,
      'pageIndex': instance.pageIndex,
      'pageSize': instance.pageSize,
      'sortColumn': instance.sortColumn,
      'sortDirection': instance.sortDirection,
      'search': instance.search,
      'readDto': instance.readDto,
    };

ReadDto _$ReadDtoFromJson(Map<String, dynamic> json) => ReadDto(
      departmentId: json['departmentId'] as num?,
      devisionId: json['devisionId'] as num?,
      unitId: json['unitId'] as num?,
      id: (json['id'] as num?)?.toInt(),
      employeeId: json['employeeId'] as num?,
    );

Map<String, dynamic> _$ReadDtoToJson(ReadDto instance) => <String, dynamic>{
      'departmentId': instance.departmentId,
      'devisionId': instance.devisionId,
      'unitId': instance.unitId,
      'id': instance.id,
      'employeeId': instance.employeeId,
    };
