import 'package:get/get.dart';
import 'package:taxiapp/controllers/auth/auth_controller.dart';
import 'package:taxiapp/controllers/login_controller.dart';
import 'package:taxiapp/controllers/orders_controller.dart';
import 'package:taxiapp/core/fetchApi.dart';

class MyBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(ThemeController());
    // Get.put(AuthController());
    // final LoginController _loginController =
    Get.put(FetchApi());    
    Get.put(LoginController());
    Get.put(OrdersControllerImp());
  }
}
