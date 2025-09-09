import 'package:json_annotation/json_annotation.dart';

part 'attendance_response_model.g.dart';

@JsonSerializable()
class AttendanceResponseModel {
  AttendanceResponseModel({
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
  final List<DateEvent>? data;

  AttendanceResponseModel copyWith({
    num? pageIndex,
    num? pageSize,
    num? count,
    num? pagesCount,
    num? itemsCount,
    bool? hasPreviousPage,
    bool? hasNextPage,
    List<DateEvent>? data,
  }) {
    return AttendanceResponseModel(
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

  factory AttendanceResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AttendanceResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceResponseModelToJson(this);

  @override
  String toString() {
    return "$pageIndex, $pageSize, $count, $pagesCount, $itemsCount, $hasPreviousPage, $hasNextPage, $data, ";
  }
}

@JsonSerializable()
class DateEvent {
  DateEvent({required this.id, required this.date, required this.attendances});

  final num? id;
  final DateTime? date;
  final List<AttendanceEvent>? attendances;

  DateEvent copyWith({num? id, DateTime? date, List<AttendanceEvent>? attendances}) {
    return DateEvent(
      id: id ?? this.id,
      date: date ?? this.date,
      attendances: attendances ?? this.attendances,
    );
  }

  factory DateEvent.fromJson(Map<String, dynamic> json) => _$DateEventFromJson(json);

  Map<String, dynamic> toJson() => _$DateEventToJson(this);

  @override
  String toString() {
    return "$id, $date, $attendances, ";
  }
}

@JsonSerializable()
class AttendanceEvent {
  AttendanceEvent({
    required this.id,
    required this.employeeId,
    required this.employeeName,
    required this.shiftName,
    required this.date,
    required this.checkIn,
    required this.checkOut,
    required this.actualHours,
    required this.lateMinutes,
    required this.earlyLeaveMinutes,
    required this.isAbsent,
    required this.leaveName,
    required this.attendanceType,
  });

  final int? id;
  final num? employeeId;
  final String? employeeName;
  final String? shiftName;
  final DateTime? date;
  final String? checkIn;
  final String? checkOut;
  final num? actualHours;
  final num? lateMinutes;
  final num? earlyLeaveMinutes;
  final bool? isAbsent;
  final dynamic leaveName;
  final num? attendanceType;

  AttendanceEvent copyWith({
    int? id,
    num? employeeId,
    String? employeeName,
    String? shiftName,
    DateTime? date,
    String? checkIn,
    String? checkOut,
    num? actualHours,
    num? lateMinutes,
    num? earlyLeaveMinutes,
    bool? isAbsent,
    dynamic leaveName,
    num? attendanceType,
  }) {
    return AttendanceEvent(
      id: id ?? this.id,
      employeeId: employeeId ?? this.employeeId,
      employeeName: employeeName ?? this.employeeName,
      shiftName: shiftName ?? this.shiftName,
      date: date ?? this.date,
      checkIn: checkIn ?? this.checkIn,
      checkOut: checkOut ?? this.checkOut,
      actualHours: actualHours ?? this.actualHours,
      lateMinutes: lateMinutes ?? this.lateMinutes,
      earlyLeaveMinutes: earlyLeaveMinutes ?? this.earlyLeaveMinutes,
      isAbsent: isAbsent ?? this.isAbsent,
      leaveName: leaveName ?? this.leaveName,
      attendanceType: attendanceType ?? this.attendanceType,
    );
  }

  factory AttendanceEvent.fromJson(Map<String, dynamic> json) =>
      _$AttendanceEventFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceEventToJson(this);

  @override
  String toString() {
    return "$id, $employeeId, $employeeName, $shiftName, $date, $checkIn, $checkOut, $actualHours, $lateMinutes, $earlyLeaveMinutes, $isAbsent, $leaveName, $attendanceType, ";
  }
}

/*
{
	"pageIndex": 1,
	"pageSize": 1,
	"count": 0,
	"pagesCount": 2,
	"itemsCount": 2,
	"hasPreviousPage": false,
	"hasNextPage": true,
	"data": [
		{
			"id": null,
			"date": "2025-07-15T00:00:00",
			"attendances": [
				{
					"id": 5,
					"employeeId": 4,
					"employeeName": "Aidan Lester",
					"shiftName": "مسائي",
					"date": "2025-07-15T00:00:00",
					"checkIn": null,
					"checkOut": "20:43:00",
					"actualHours": 0,
					"lateMinutes": 0,
					"earlyLeaveMinutes": 0,
					"isAbsent": false,
					"leaveName": null,
					"attendanceType": 1
				},
				{
					"id": 2,
					"employeeId": 4,
					"employeeName": "Aidan Lester",
					"shiftName": "مسائي",
					"date": "2025-07-15T00:00:00",
					"checkIn": "14:44:00",
					"checkOut": null,
					"actualHours": 0,
					"lateMinutes": 0,
					"earlyLeaveMinutes": 0,
					"isAbsent": false,
					"leaveName": null,
					"attendanceType": 0
				}
			]
		}
	]
}*/
