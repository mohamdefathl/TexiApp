import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DarkModeController extends GetxController {

  void switchToDarkMode() {
    Get.changeThemeMode(ThemeMode.dark);
    update();
  }

  void switchToLightMode() {
    Get.changeThemeMode(ThemeMode.light);
    update();
  }
}
