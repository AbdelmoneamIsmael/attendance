import 'package:attendance/core/models/language_model.dart';
import 'package:attendance/core/routes/pages_keys.dart';

const kRefreshToken = "refreshToken";
// const prodBaseURl = "https://hr-api.runasp.net";
const prodBaseURl = "https://hr-api.almahd-it.com";
const mapbaseURl = "https://openstreet.almahd-it.com/";
String kDeviceToken = "";
// String kInitialRoute = PagesKeys.internalPlaceDetailsScreen;
String kInitialRoute = PageKeys.loginScreen;
// String token = "";
const kFontFamily = "Tajawal";
const kAppName = "Attendance";

const internalLocalError = 700; // englishFont = "Poppins";

class AppConstants {
  static const String COUNTRY_CODE = 'country_code';
  static const String LANGUAGE_CODE = 'language_code';

  static List<LanguageModel> languages = [
    LanguageModel(
      imageUrl: "🇺🇸",
      languageName: 'English',
      countryCode: 'US',
      languageCode: 'en',
    ),
    LanguageModel(
      imageUrl: "🇸🇦",
      languageName: 'Arabic',
      countryCode: 'IQ',
      languageCode: 'ar',
    ),
  ];
}

class FireBaseTabels {
  FireBaseTabels._();
  static const connectedDevices = "connected_devices";
  static const employees = "employees";
  static const employeeInfo = "employees_info";
}
