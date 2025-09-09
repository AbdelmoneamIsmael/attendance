import 'package:attendance/core/models/attendance_events/attendance_params.dart';
import 'package:attendance/core/models/attendance_events/attendance_response_model.dart';
import 'package:attendance/core/repo/employees_repo/repo/employee_repo.dart';
import 'package:attendance/core/widgets/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttendCalenderController extends GetxController {
  late int employeeId;
  EmployeeRepo employeeRepo = Get.find<EmployeeRepo>();
  bool isLoadingUserInformation = false;
  //pagination
  int pageIndex = 1;
  final ScrollController scrollController = ScrollController();
  var isThereMoreItems = true;
  bool isLoading = false;
  int pageSize = 6;
  AttendanceResponseModel? attendanceResults;
  List<DateEvent> dateEvents = [];
  @override
  void onInit() {
    String employeeID = Get.parameters["employeeID"] ?? "0";
    employeeId = int.parse(employeeID);
    getUserAttendance().then((value) => initscrollPagenation());
    super.onInit();
  }

  void _onScroll() {
    if (scrollController.hasClients) {
      double currentPosition = scrollController.position.pixels;
      double maxScrollExtent = scrollController.position.maxScrollExtent;
      double seventyPercentOffset = maxScrollExtent * 0.7;

      if (currentPosition >= seventyPercentOffset &&
          !isLoading &&
          isThereMoreItems) {
        getUserAttendance();
      }
    }
  }

  void initscrollPagenation() {
    scrollController.addListener(_onScroll);
  }

  Future<void> getUserAttendance() async {
    isLoading = true;
    AttendanceParams attendanceParams = AttendanceParams(
      isPagingEnabled: true,
      pageIndex: pageIndex,
      pageSize: pageSize,
      sortColumn: null,
      sortDirection: null,
      search: "",
      readDto: AttendReadDto(date: null, id: null, employeeId: employeeId),
    );
    var results = await employeeRepo.getEmployeeAttendances(
      attendanceParams: attendanceParams,
    );
    results.fold(
      (l) {
        isLoading = false;
        isThereMoreItems = false;
        UIHelper.showSnakBar(message: l.message);
        update();
      },
      (r) {
        print(r.toString());
        print("lenth attendance${r.data?.length}");
        isLoading = false;
        attendanceResults = r;
        dateEvents.addAll(r.data ?? []);
        isThereMoreItems = r.hasNextPage ?? false;
        pageIndex++;
        update();
      },
    );
  }
}
