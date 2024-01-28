import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxiapp/services/services.dart';

class DarkModeController extends GetxController {
MyServices myServices = Get.find();
Future<void> logout() async {
    myServices.secureStorage.deleteAll();
    Get.offNamed('/login',);    
    myServices.isLogedIn = false;
  }

  void switchToDarkMode() {
    Get.changeThemeMode(ThemeMode.dark);
    update();
  }

  void switchToLightMode() {
    Get.changeThemeMode(ThemeMode.light);
    update();
  }
}
