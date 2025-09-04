import 'package:json_annotation/json_annotation.dart';

part 'employee_info.g.dart';

@JsonSerializable()
class EmployeeInformation {
  EmployeeInformation({required this.employeeView, required this.shiftView});

  final EmployeeView? employeeView;
  final ShiftView? shiftView;

  EmployeeInformation copyWith({
    EmployeeView? employeeView,
    ShiftView? shiftView,
  }) {
    return EmployeeInformation(
      employeeView: employeeView ?? this.employeeView,
      shiftView: shiftView ?? this.shiftView,
    );
  }

  factory EmployeeInformation.fromJson(Map<String, dynamic> json) =>
      _$EmployeeInformationFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeInformationToJson(this);

  @override
  String toString() {
    return "$employeeView, $shiftView, ";
  }
}

@JsonSerializable()
class EmployeeView {
  EmployeeView({
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
  });

  final int? id;
  final String? name;
  final String? email;
  final String? phoneNumber;
  final String? hireDate;
  final num? baseSalary;
  final String? attendType;
  final String? jobNumber;
  final dynamic jobGrade;
  final String? shift;
  final dynamic employeeType;
  final String? address;
  final num? gender;

  EmployeeView copyWith({
    int? id,
    String? name,
    String? email,
    String? phoneNumber,
    String? hireDate,
    num? baseSalary,
    String? attendType,
    String? jobNumber,
    dynamic? jobGrade,
    String? shift,
    dynamic? employeeType,
    String? address,
    num? gender,
  }) {
    return EmployeeView(
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
    );
  }

  factory EmployeeView.fromJson(Map<String, dynamic> json) =>
      _$EmployeeViewFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeViewToJson(this);

  @override
  String toString() {
    return "$id, $name, $email, $phoneNumber, $hireDate, $baseSalary, $attendType, $jobNumber, $jobGrade, $shift, $employeeType, $address, $gender, ";
  }
}

@JsonSerializable()
class ShiftView {
  ShiftView({
    required this.id,
    required this.name,
    required this.startTime,
    required this.endTime,
    required this.requiredHours,
    required this.graceInMinutes,
    required this.graceOutMinutes,
  });

  final int? id;
  final String? name;
  final String? startTime;
  final String? endTime;
  final num? requiredHours;
  final num? graceInMinutes;
  final num? graceOutMinutes;

  ShiftView copyWith({
    int? id,
    String? name,
    String? startTime,
    String? endTime,
    num? requiredHours,
    num? graceInMinutes,
    num? graceOutMinutes,
  }) {
    return ShiftView(
      id: id ?? this.id,
      name: name ?? this.name,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      requiredHours: requiredHours ?? this.requiredHours,
      graceInMinutes: graceInMinutes ?? this.graceInMinutes,
      graceOutMinutes: graceOutMinutes ?? this.graceOutMinutes,
    );
  }

  factory ShiftView.fromJson(Map<String, dynamic> json) =>
      _$ShiftViewFromJson(json);

  Map<String, dynamic> toJson() => _$ShiftViewToJson(this);

  @override
  String toString() {
    return "$id, $name, $startTime, $endTime, $requiredHours, $graceInMinutes, $graceOutMinutes, ";
  }
}

/*
{
	"employeeView": {
		"id": 4,
		"name": "Aidan Lester",
		"email": "gifufa@mailinator.com",
		"phoneNumber": "+1 (249) 574-7227",
		"hireDate": "1/1/2025 12:00:00 AM",
		"baseSalary": 700000,
		"attendType": "ShiftBased",
		"jobNumber": "336",
		"jobGrade": null,
		"shift": "كل يوم",
		"employeeType": null,
		"address": "Sed adipisicing volu",
		"gender": 2
	},
	"shiftView": {
		"id": 4,
		"name": "كل يوم",
		"startTime": "08:00:00",
		"endTime": "17:00:00",
		"requiredHours": 9,
		"graceInMinutes": 15,
		"graceOutMinutes": 15
	}
}*/

