import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BottommNavBarController extends GetxController {
  var selectedIndex = 2;

  void onItemTapped(int index) {
    selectedIndex = index;
    update();
  }

  List bottomNavBar = [
    {"title": "الاعدادات ", "icon":  Iconsax.setting_2},
    {"title": "توصيلاتي ", "icon":  Iconsax.archive4},
    // {"title": "الخارطة ", "icon":  Iconsax.map},
    {"title": "في الطريق", "icon":  Icons.delivery_dining_outlined},    
    {"title": "الصفحة الرئيسية", "icon":  Iconsax.home},    
  ];
}
