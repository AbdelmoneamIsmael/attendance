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
        attendanceResults = r;
        dateEvents.addAll(r.data ?? []);
        isThereMoreItems = r.hasNextPage ?? false;
        pageIndex++;
        isLoading = false;
        fillMissingDates();
        update();
      },
    );
  }

  Future<void> refreshAttendance() async {
    pageIndex = 1;
    isThereMoreItems = true;
    dateEvents.clear();
    await getUserAttendance();
  }

  void fillMissingDates() {
    if (dateEvents.isEmpty) return;

    // // ترتيب الليستة بالتاريخ (لو مش مترتبة)
    // dateEvents.sort((a, b) => a.date!.compareTo(b.date!));

    List<DateEvent> fullList = [];
    DateTime start = dateEvents.last.date!; // أقدم تاريخ
    DateTime end = DateTime.now(); // أحدث تاريخ

    DateTime current = start;
    print(current.isAfter(end));
    while (!current.isAfter(end)) {
      print(current.isAfter(end));
      // لو التاريخ موجود في الداتا
      DateEvent? existing = dateEvents.firstWhereOrNull(
        (d) => DateUtils.isSameDay(d.date, current),
      );

      if (existing != null) {
        fullList.add(existing);
      } else {
        // نضيف تاريخ ناقص بحضور فاضي
        fullList.add(DateEvent(id: null, date: current, attendances: []));
      }

      current = current.add(const Duration(days: 1));
    }
    dateEvents = fullList;
    dateEvents.sort((a, b) => b.date!.compareTo(a.date!));
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
