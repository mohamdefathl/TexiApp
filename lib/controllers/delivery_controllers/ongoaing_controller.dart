import 'dart:convert';

import 'package:get/get.dart';
import 'package:taxiapp/controllers/auth/auth_controller.dart';
import 'package:taxiapp/core/AppUrl.dart';
import 'package:taxiapp/core/stateRequset.dart';
import 'package:taxiapp/data/remote/ongoaing.dart';
import 'package:taxiapp/functions/hundlingdata.dart';
import 'package:http/http.dart' as http;

class OnGoaingController extends GetxController {
  OnGoaingPageData onGoaingPageData = OnGoaingPageData(Get.find());

  final AuthController authController = Get.find<AuthController>();
  List data = [];
  late StatusRequest statusRequest;

  @override
  void onInit() async {
    statusRequest = StatusRequest.loading;
    String token = authController.token;

    await getData(token);

    super.onInit();
  }

  Future getData(String token) async {
    statusRequest = StatusRequest.loading;
    var response = await onGoaingPageData.getData(token);    
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      data = response['results'];
      print("ON GOAING DATA $data");
    }
    update();
  }

  Future<void> updateDeliveryOrder(int orderId, String state) async {
    print(authController.token);
    print(orderId);

    try {
      final response = await http.put(
        Uri.parse("${AppApiUrl.changeOrderState}$orderId/"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token ${authController.token}',
        },
        body: jsonEncode({"status": state}),
      );

      if (response.statusCode == 200) {
        print('PUT Request Successful');
        print('Response: ${response.body}');
        getData(authController.token);
      } else {
        print('PUT Request Failed with status code: ${response.statusCode}');
        print('Error: ${response.body}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}
