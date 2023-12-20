import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:taxiapp/controllers/auth/auth_controller.dart';
import 'package:taxiapp/controllers/delivery_controllers/orders_controller.dart';
import 'package:taxiapp/controllers/user_controller.dart';
import 'package:taxiapp/core/AppUrl.dart';
import 'package:flutter/material.dart';
import 'package:taxiapp/view/widget/general/dialog.dart';

class LoginController extends GetxController {
  final UserController userController = Get.put(UserController());
  final AuthController authController = Get.find<AuthController>();

  final nameText = TextEditingController();
  final passText = TextEditingController();
  @override
  void onClose() {
    nameText.dispose();
    passText.dispose();
    super.onClose();
  }

  Future<bool> isConnectedToWifi() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> login() async {
    try {
      final url = Uri.parse(AppApiUrl.auth);
      final response = await http.post(
        url,
        body: {
          'username': 'mohamed',
          'password': 'mohamed',
          // 'username': 'taxi',
          // 'password': '123',
          // 'username': nameText.text,
          // 'password': passText.text,
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(utf8.decode(response.bodyBytes));

        final token = data['token'];
        final user = data['user'];
        print(user);

        authController.setToken(token);
        userController.setUserData(user);
        authController.setRole(user['role']);
        if (user['role'] == "deliver") {
          Get.offAllNamed('/home');
          Get.delete<LoginController>();
        } else {
          Get.offAllNamed('/taxihome');
          Get.delete<LoginController>();
        }
      } else {
        dialog(
            hasCancelButton: false,
            title: 'حدث خطاء ما ',
            content: "يرجى التاكد من صحة البيانات",
            confirmOnClick: () {
              Get.back();
            },
            confirmTitle: "اغلاق");
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
