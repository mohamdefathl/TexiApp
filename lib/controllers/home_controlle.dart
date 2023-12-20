import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:taxiapp/controllers/auth/auth_controller.dart';
import 'package:taxiapp/controllers/delivery_controllers/orders_controller.dart';
import 'package:taxiapp/controllers/delivery_controllers/ongoaing_controller.dart';

class HomeController extends GetxController {
  final AuthController authController = Get.find<AuthController>();

  final OrdersControllerImp ordersControllerImp =
      Get.put(OrdersControllerImp(), permanent: true);
  final OnGoaingController onGoaingController =
      Get.put(OnGoaingController(), permanent: true);

  var selectedIndex = 3;

  void onItemTapped(int index) {
    switch (index) {
      case 2:
        onGoaingController.getData(authController.token);
        break;
      case 3:
        ordersControllerImp.getData(authController.token);
        break;
      default:
    }
    selectedIndex = index;
    update();
  }

  List bottomNavBar = [
    {"title": "الاعدادات ", "icon": Iconsax.setting_2},
    {"title": "توصيلاتي ", "icon": Iconsax.archive4},
    {"title": "في الطريق", "icon": Icons.delivery_dining_outlined},
    {"title": "الصفحة الرئيسية", "icon": Iconsax.home},
  ];
}
