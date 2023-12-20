import 'package:get/get.dart';

class AuthController extends GetxController {
   String token='';
   String role='';

  void setToken(String value) {
    token = value;
  }
  void setRole(String value) {
    role = value;
  }
}