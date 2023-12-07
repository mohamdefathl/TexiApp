import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
      title: "تنبيه",
      middleText: "هل تريد الخروج من التطبيق",
      actions: [
        ElevatedButton(

            onPressed: () {
              exit(0);
            },
            child:const Text("خروج",style: TextStyle(color: Colors.white))),
        ElevatedButton(

            onPressed: () {
              Get.back();
            },
            child:const Text("الغاء",style: TextStyle(color: Colors.white))),
      ]);

  return Future.value(true);
}
