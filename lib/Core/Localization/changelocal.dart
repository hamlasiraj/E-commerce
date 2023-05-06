import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/Core/Constant/app_theme.dart';
import 'package:store/Core/Services/services.dart';

class LocaleConroller extends GetxController {
  Locale? language;
  ThemeData appTheme = englishTheme;

  MyServices myServices = Get.find();

  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    appTheme = langcode == "ar" ? arabicTheme : englishTheme;
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
      appTheme = arabicTheme;
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
      appTheme = englishTheme;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = englishTheme;
    }
    super.onInit();
  }
}
