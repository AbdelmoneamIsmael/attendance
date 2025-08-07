import 'package:attendance/core/themes/theme/custom_theme.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  getTheme() {
    if (Get.isDarkMode) {
      return darkTheme;
    } else {
      return lightTheme;
    }
  }
}
