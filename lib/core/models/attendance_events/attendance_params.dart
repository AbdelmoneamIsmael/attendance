import 'package:json_annotation/json_annotation.dart';

part 'attendance_params.g.dart';

@JsonSerializable()
class AttendanceParams {
  AttendanceParams({
    required this.isPagingEnabled,
    required this.pageIndex,
    required this.pageSize,
    required this.sortColumn,
    required this.sortDirection,
    required this.search,
    required this.readDto,
  });

  final bool? isPagingEnabled;
  final num? pageIndex;
  final num? pageSize;
  final String? sortColumn;
  final String? sortDirection;
  final String? search;
  final AttendReadDto? readDto;

  AttendanceParams copyWith({
    bool? isPagingEnabled,
    num? pageIndex,
    num? pageSize,
    String? sortColumn,
    String? sortDirection,
    String? search,
    AttendReadDto? readDto,
  }) {
    return AttendanceParams(
      isPagingEnabled: isPagingEnabled ?? this.isPagingEnabled,
      pageIndex: pageIndex ?? this.pageIndex,
      pageSize: pageSize ?? this.pageSize,
      sortColumn: sortColumn ?? this.sortColumn,
      sortDirection: sortDirection ?? this.sortDirection,
      search: search ?? this.search,
      readDto: readDto ?? this.readDto,
    );
  }

  factory AttendanceParams.fromJson(Map<String, dynamic> json) =>
      _$AttendanceParamsFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceParamsToJson(this);

  @override
  String toString() {
    return "$isPagingEnabled, $pageIndex, $pageSize, $sortColumn, $sortDirection, $search, $readDto, ";
  }
}

@JsonSerializable()
class AttendReadDto {
  AttendReadDto({required this.id, required this.employeeId, required this.date});

  final int? id;
  final num? employeeId;
  final DateTime? date;

  AttendReadDto copyWith({int? id, num? employeeId, DateTime? date}) {
    return AttendReadDto(
      id: id ?? this.id,
      employeeId: employeeId ?? this.employeeId,
      date: date ?? this.date,
    );
  }

  factory AttendReadDto.fromJson(Map<String, dynamic> json) =>
      _$AttendReadDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AttendReadDtoToJson(this);

  @override
  String toString() {
    return "$id, $employeeId, $date, ";
  }
}

/*
{
	"isPagingEnabled": true,
	"pageIndex": 0,
	"pageSize": 0,
	"sortColumn": "string",
	"sortDirection": "string",
	"search": "string",
	"readDto": {
		"id": 0,
		"employeeId": 0,
		"date": "2025-09-09T19:19:04.071Z"
	}
}*/
