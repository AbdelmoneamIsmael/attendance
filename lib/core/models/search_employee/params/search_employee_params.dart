import 'package:json_annotation/json_annotation.dart';

part 'search_employee_params.g.dart';

@JsonSerializable()
class SearchParams {
  SearchParams({
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
  final ReadDto? readDto;

  SearchParams copyWith({
    bool? isPagingEnabled,
    num? pageIndex,
    num? pageSize,
    String? sortColumn,
    String? sortDirection,
    String? search,
    ReadDto? readDto,
  }) {
    return SearchParams(
      isPagingEnabled: isPagingEnabled ?? this.isPagingEnabled,
      pageIndex: pageIndex ?? this.pageIndex,
      pageSize: pageSize ?? this.pageSize,
      sortColumn: sortColumn ?? this.sortColumn,
      sortDirection: sortDirection ?? this.sortDirection,
      search: search ?? this.search,
      readDto: readDto ?? this.readDto,
    );
  }

  factory SearchParams.fromJson(Map<String, dynamic> json) =>
      _$SearchParamsFromJson(json);

  Map<String, dynamic> toJson() => _$SearchParamsToJson(this);

  @override
  String toString() {
    return "$isPagingEnabled, $pageIndex, $pageSize, $sortColumn, $sortDirection, $search, $readDto, ";
  }
}

@JsonSerializable()
class ReadDto {
  ReadDto({
    required this.departmentId,
    required this.devisionId,
    required this.unitId,
    required this.id,
    required this.employeeId,
  });

  final num? departmentId;
  final num? devisionId;
  final num? unitId;
  final int? id;
  final num? employeeId;

  ReadDto copyWith({
    num? departmentId,
    num? devisionId,
    num? unitId,
    int? id,
    num? employeeId,
  }) {
    return ReadDto(
      departmentId: departmentId ?? this.departmentId,
      devisionId: devisionId ?? this.devisionId,
      unitId: unitId ?? this.unitId,
      id: id ?? this.id,
      employeeId: employeeId ?? this.employeeId,
    );
  }

  factory ReadDto.fromJson(Map<String, dynamic> json) =>
      _$ReadDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ReadDtoToJson(this);

  @override
  String toString() {
    return "$departmentId, $devisionId, $unitId, $id, $employeeId, ";
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
		"departmentId": 0,
		"devisionId": 0,
		"unitId": 0,
		"id": 0,
		"employeeId": 0
	}
}*/
