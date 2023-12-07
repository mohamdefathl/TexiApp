import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:taxiapp/core/AppUrl.dart';
import 'package:flutter/material.dart';
import 'package:taxiapp/view/widget/general/dialog.dart';

class LoginController extends GetxController {
  final nameText = TextEditingController();
  final passText = TextEditingController();
  @override
  void onClose() {
    print("ONCLOSE SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS");
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
          'username': '123123123',
          'password': '123123123',
          // 'username': nameText.text,
          // 'password': passText.text,
        },
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final token = data['token'];
        final user=data['user'];
        print("Token $token");
        print("user info $user");
        Get.toNamed('/home');
        // print(response.body);
      } else {
        dialog(
            title: 'حدث خطاء ما ',
            content: "يرجى التاكد من صحة البيانات",
            onPress: () {
              Get.back();
            },
            buttonTitle: "اغلاق");
        print(response.statusCode);
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
