class AppEndPoints {
  //authintication
  static const String getLogin = '/api/Authentication/token';
  //employees
  static const String getEmployeeInfo = '/api/Employees/GetEmployee';
  static const String getSubEmployees = '/api/Employees/GetAllSupEmployees';
  static const String getEmployeeAttendances = '/api/Employees/GetAllEmployeesAttendance';
  static const String addAttend = '/api/Attendances/Add';
  //notification
  static const String getNotifications = '/api/Notifications/GetAll';
}
