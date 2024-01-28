
import 'package:taxiapp/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthMiddleWare extends GetMiddleware {
  @override
  int? get priority => 0;
  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.isLogedIn) {
      return null;
    }
    return const RouteSettings(name: '/login');
  }
}
