import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taxiapp/controllers/auth/auth_controller.dart';
import 'package:taxiapp/core/AppUrl.dart';

class DetailPageController extends GetxController {
  final AuthController authController = Get.find<AuthController>();

  Future<void> updateDeliveryOrder(int orderId) async {
    

    try {
      final response = await http.put(
        Uri.parse("${AppApiUrl.changeOrderState}$orderId/"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token ${authController.token}',
        },
        body: jsonEncode({ "status": "in_way"}),
      );

      if (response.statusCode == 200) {
        print('PUT Request Successful');
        print('Response: ${response.body}');
        
      } else {
        print('PUT Request Failed with status code: ${response.statusCode}');
        print('Error: ${response.body}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

// Usage
}
