import 'package:ecommerce_1/core/constants/themes.dart';
import 'package:ecommerce_1/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalController extends GetxController {
  Locale? language;

  AppServices appServices = Get.find();

  ThemeData appTheme = AppThemes.enThemeData;

  changeLanguage(String languageCode) {
    Locale locale = Locale(languageCode);
    appServices.sharedPreferences.setString('lang', languageCode);
    appTheme =
        languageCode == 'ar' ? AppThemes.arThemeData : AppThemes.enThemeData;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPrefLang = appServices.sharedPreferences.getString('lang');

    if (sharedPrefLang == 'ar') {
      language = const Locale('ar');
      appTheme = AppThemes.arThemeData;
    } else if (sharedPrefLang == 'en') {
      language = const Locale('en');
      appTheme = AppThemes.enThemeData;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = AppThemes.enThemeData;
    }
    super.onInit();
  }
}
