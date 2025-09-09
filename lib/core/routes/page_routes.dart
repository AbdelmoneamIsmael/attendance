import 'package:attendance/core/routes/pages_keys.dart';
import 'package:attendance/features/all_attendance_calender/presentation/controller/all_attendance_calender_bindings.dart';
import 'package:attendance/features/all_attendance_calender/presentation/pages/all_attend_calender.dart';
import 'package:attendance/features/home/presentation/controller/home_bindings.dart';
import 'package:attendance/features/home/presentation/pages/home_screen.dart';
import 'package:attendance/features/login_screen/presentation/controller/login_bindings.dart';
import 'package:attendance/features/login_screen/presentation/pages/login_screen.dart';
import 'package:attendance/features/notification/presentation/controller/notification_bindings.dart';
import 'package:attendance/features/notification/presentation/pages/notification_page.dart';
import 'package:attendance/features/profile_screen/presentation/cubit/profile_screen_bindning.dart';
import 'package:attendance/features/profile_screen/presentation/pages/profile_screen.dart';
import 'package:get/get.dart';

class AppPages {
  AppPages._();
  static const initial = PageKeys.loginScreen;

  static final routes = [
    GetPage(
      name: PageKeys.loginScreen,

      page: () => const LoginScreen(),
      binding: LoginBindings(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: PageKeys.homeScreen,

      page: () => const HomeScreen(),
      binding: HomeBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: PageKeys.notificationScreen,
      page: () => const NotificationPage(),
      binding: NotificationBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: "${PageKeys.allAttendCalender}/:employeeID",
      page: () => const AllAttendCalender(),
      binding: AttendanceBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: "${PageKeys.profileScreen}/:employeeID",
      page: () {
        return const ProfileScreen();
      },
      binding: ProfileBinding(),
      transition: Transition.cupertino,
    ),
  ];
}
