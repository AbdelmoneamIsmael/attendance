import 'dart:async';

import 'package:attendance/core/controllers/auth_controller/auth_controller.dart';
import 'package:attendance/core/models/account_model/employee_info.dart';
import 'package:attendance/core/models/attendance_events/attendance_params.dart';
import 'package:attendance/core/models/attendance_events/attendance_response_model.dart';
import 'package:attendance/core/models/search_employee/params/search_employee_params.dart';
import 'package:attendance/core/models/search_employee/response_model/employee_search_response_model.dart';
import 'package:attendance/core/repo/employees_repo/repo/employee_repo.dart';
import 'package:attendance/core/widgets/ui_helper.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late EmployeeInformation employeeInformation;
  final employeeRepo = Get.find<EmployeeRepo>();

  //pagination
  int pageIndex = 1;
  TextEditingController searchController = TextEditingController();

  final ScrollController scrollController = ScrollController();
  var isThereMoreItems = true;
  bool isLoading = false;
  int pageSize = 10;
  EmployeeSearchResult? employeeSearchResult;
  List<EmployeeCardEntity> employees = [];

  //for search in typing after 1 sec to detrmind if user want to search on this word or continue typing
  Timer? typingTimer;

  @override
  void onInit() {
    employeeInformation = Get.find<AuthController>().employeeInformation;
    getAttendanceEvents();
    initscrollPagenation();
    typingTimer?.cancel();
    super.onInit();
  }

  @override
  void dispose() {
    scrollController.dispose();
    searchController.dispose();
    super.dispose();
  }

  void initscrollPagenation() {
    if (employeeInformation.employeeView?.isManager == true) {
      scrollController.addListener(_onScroll);
    }
  }

  void _onScroll() {
    if (scrollController.hasClients) {
      double currentPosition = scrollController.position.pixels;
      double maxScrollExtent = scrollController.position.maxScrollExtent;
      double seventyPercentOffset = maxScrollExtent * 0.7;

      if (currentPosition >= seventyPercentOffset &&
          !isLoading &&
          isThereMoreItems) {
        getEmployeesWhoIManaged();
      }
    }
  }

  Future<void> getEmployeesWhoIManaged() async {
    isLoading = true;
    SearchParams searchParams = SearchParams(
      isPagingEnabled: true,
      pageIndex: pageIndex,
      pageSize: pageSize,
      sortColumn: null,
      sortDirection: null,
      search: searchController.text,
      readDto: ReadDto(
        departmentId: null,
        devisionId: null,
        unitId: null,
        id: null,
        employeeId: employeeInformation.employeeView?.id,
      ),
    );
    var results = await employeeRepo.getSubEmplyees(searchParams: searchParams);
    results.fold(
      (l) {
        isLoading = false;
        isThereMoreItems = false;
        UIHelper.showSnakBar(message: l.message);
        update();
      },
      (r) {
        print(r.toString());
        print("lenth${r.data?.length}");
        isLoading = false;
        employeeSearchResult = r;
        employees.addAll(r.data ?? []);
        isThereMoreItems = r.hasNextPage ?? false;
        pageIndex++;
        update();
      },
    );
  }

  void onSearch() {
    typingTimer?.cancel();
    typingTimer = Timer(const Duration(seconds: 1), () {
      pageIndex = 1;
      employees.clear();
      getEmployeesWhoIManaged();
    });
  }

  //////attendace//////
  ///
  ///
  ///
  List<DateEvent> attendancesDayEvent = [];
  bool gettingAttendance = false;
  Future<void> getAttendanceEvents() async {
    gettingAttendance = true;
    update();
    var result = await employeeRepo.getEmployeeAttendances(
      attendanceParams: AttendanceParams(
        isPagingEnabled: true,
        pageIndex: 1,
        pageSize: 1,
        sortColumn: null,
        sortDirection: null,
        search: "",
        readDto: AttendReadDto(
          id: null,
          employeeId: employeeInformation.employeeView?.id,
          date: null,
        ),
      ),
    );
    result.fold(
      (l) {
        gettingAttendance = false;
        UIHelper.showSnakBar(message: l.message);
        update();
      },
      (r) {
        attendancesDayEvent = r.data ?? [];
        gettingAttendance = false;
        update();
      },
    );
  }
}
