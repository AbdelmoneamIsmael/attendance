import 'package:attendance/core/models/language_model.dart';
import 'package:attendance/core/routes/pages_keys.dart';
import 'package:flutter/cupertino.dart';

const kRefreshToken = "refreshToken";
const prodBaseURl = "https://aman.runasp.net";
const mapbaseURl = "https://openstreet.almahd-it.com/";
String kDeviceToken = "";
// String kInitialRoute = PagesKeys.internalPlaceDetailsScreen;
String kInitialRoute = PageKeys.loginScreen;
// String token = "";
const kFontFamily = "Tajawal";
const kAppName = "Pharma Plus";

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
