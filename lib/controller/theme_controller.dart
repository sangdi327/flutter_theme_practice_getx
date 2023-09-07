import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends FullLifeCycleController with FullLifeCycleMixin {
  Rx<ThemeMode> themeMode = ThemeMode.light.obs;
  final SharedPreferences preferences;
  ThemeController(this.preferences);

  @override
  void onInit() {
    super.onInit();
    init();
  }

  init() {
    bool? isDarkModeData = preferences.getBool('isDarkMode');
    if (isDarkModeData == null) {
      themeMode(Get.isPlatformDarkMode ? ThemeMode.dark : ThemeMode.light);
    } else {
      updateThemeMode(isDarkModeData ? ThemeMode.dark : ThemeMode.light);
    }
  }

  updateThemeMode(ThemeMode mode, {bool saveThemeModeState = false}) {
    themeMode(mode);
    if (saveThemeModeState) {
      saveLocalThemeMode();
    }
  }

  saveLocalThemeMode() {
    preferences.setBool('isDarkMode', themeMode.value == ThemeMode.dark);
  }

  // bool? isDarkMode() {
  //   return preferences.getBool('isDarkMode');
  // }

  @override
  void onDetached() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {
    init();
  }
}
