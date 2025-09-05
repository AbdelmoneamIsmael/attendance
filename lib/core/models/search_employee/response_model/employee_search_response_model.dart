import 'package:json_annotation/json_annotation.dart';

part 'employee_search_response_model.g.dart';

@JsonSerializable()
class EmployeeSearchResult {
  EmployeeSearchResult({
    required this.pageIndex,
    required this.pageSize,
    required this.count,
    required this.pagesCount,
    required this.itemsCount,
    required this.hasPreviousPage,
    required this.hasNextPage,
    required this.data,
  });

  final num? pageIndex;
  final num? pageSize;
  final num? count;
  final num? pagesCount;
  final num? itemsCount;
  final bool? hasPreviousPage;
  final bool? hasNextPage;
  final List<EmployeeCardEntity>? data;

  EmployeeSearchResult copyWith({
    num? pageIndex,
    num? pageSize,
    num? count,
    num? pagesCount,
    num? itemsCount,
    bool? hasPreviousPage,
    bool? hasNextPage,
    List<EmployeeCardEntity>? data,
  }) {
    return EmployeeSearchResult(
      pageIndex: pageIndex ?? this.pageIndex,
      pageSize: pageSize ?? this.pageSize,
      count: count ?? this.count,
      pagesCount: pagesCount ?? this.pagesCount,
      itemsCount: itemsCount ?? this.itemsCount,
      hasPreviousPage: hasPreviousPage ?? this.hasPreviousPage,
      hasNextPage: hasNextPage ?? this.hasNextPage,
      data: data ?? this.data,
    );
  }

  factory EmployeeSearchResult.fromJson(Map<String, dynamic> json) =>
      _$EmployeeSearchResultFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeSearchResultToJson(this);

  @override
  String toString() {
    return "page index: $pageIndex, page size: $pageSize, count: $count, pagesCount: $pagesCount, itemsCount: $itemsCount, hasPreviousPage: $hasPreviousPage, hasNextPage: $hasNextPage, data: $data";
  }
}

@JsonSerializable()
class EmployeeCardEntity {
  EmployeeCardEntity({
    required this.iAttend,
    required this.endTime,
    required this.startTime,
    required this.shiftName,
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.hireDate,
    required this.baseSalary,
    required this.attendType,
    required this.jobNumber,
    required this.jobGrade,
    required this.shift,
    required this.employeeType,
    required this.address,
    required this.gender,
    required this.imageUrl,
    required this.isManager,
    required this.employeesCount,
  });

  final int? id;
  final String? name;
  final String? email;
  final String? phoneNumber;
  final DateTime? hireDate;
  final num? baseSalary;
  final String? attendType;
  final String? jobNumber;
  final String? jobGrade;
  final String? shift;
  final String? employeeType;
  final String? address;
  final num? gender;
  final String? imageUrl;
  final String? endTime;
  final String? startTime;
  final String? shiftName;

  final bool? isManager;
  final num? employeesCount;
  final bool? iAttend;

  EmployeeCardEntity copyWith({
    int? id,
    String? name,
    String? email,
    String? phoneNumber,
    DateTime? hireDate,
    num? baseSalary,
    String? attendType,
    String? jobNumber,
    String? jobGrade,
    String? shift,
    String? employeeType,
    String? address,
    num? gender,
    String? imageUrl,
    bool? isManager,
    num? employeesCount,
    bool? iAttend,
    String? endTime,
    String? startTime,
    String? shiftName,
  }) {
    return EmployeeCardEntity(
      iAttend: iAttend ?? this.iAttend,
      endTime: endTime ?? this.endTime,
      startTime: startTime ?? this.startTime,
      shiftName: shiftName ?? this.shiftName,
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      hireDate: hireDate ?? this.hireDate,
      baseSalary: baseSalary ?? this.baseSalary,
      attendType: attendType ?? this.attendType,
      jobNumber: jobNumber ?? this.jobNumber,
      jobGrade: jobGrade ?? this.jobGrade,
      shift: shift ?? this.shift,
      employeeType: employeeType ?? this.employeeType,
      address: address ?? this.address,
      gender: gender ?? this.gender,
      imageUrl: imageUrl ?? this.imageUrl,
      isManager: isManager ?? this.isManager,
      employeesCount: employeesCount ?? this.employeesCount,
    );
  }

  factory EmployeeCardEntity.fromJson(Map<String, dynamic> json) =>
      _$EmployeeCardEntityFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeCardEntityToJson(this);

  @override
  String toString() {
    return "$id, $name, $email, $phoneNumber, $hireDate, $baseSalary, $attendType, $jobNumber, $jobGrade, $shift, $employeeType, $address, $gender, $imageUrl, $isManager, $employeesCount, ";
  }
}

/*
{
	"pageIndex": 1,
	"pageSize": 6,
	"count": 1,
	"pagesCount": 1,
	"itemsCount": 1,
	"hasPreviousPage": false,
	"hasNextPage": false,
	"data": [
		{
			"id": 10,
			"name": "ali kamal",
			"email": "ali@gmail.com",
			"phoneNumber": "012352545556",
			"hireDate": "2025-09-02 00:00:00.0000000",
			"baseSalary": 10000,
			"attendType": "Regular",
			"jobNumber": "1234567",
			"jobGrade": "مهندس",
			"shift": "مسائي",
			"employeeType": "اجر يومي",
			"address": "null",
			"gender": 1,
			"imageUrl": "null",
			"isManager": true,
			"employeesCount": 0
		}
	]
}*/
