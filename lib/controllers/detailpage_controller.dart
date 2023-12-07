import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taxiapp/core/AppUrl.dart';

class DetailPageController extends GetxController {
  Future<void> updateDeliveryOrder(int orderId, String token) async {
    

    final payload = {};

    try {
      final response = await http.put(
        Uri.parse("${AppApiUrl.changeOrderState}$orderId/"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token 46c660b365d3224d06f560be5f0bd209e6119893',
        },
        body: jsonEncode('processing'),
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
