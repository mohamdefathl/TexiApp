import 'package:get/get.dart';

class UserController extends GetxController {
  Map<String, dynamic>? user;

  void setUserData(value) {
    user = value;    
  }
}
