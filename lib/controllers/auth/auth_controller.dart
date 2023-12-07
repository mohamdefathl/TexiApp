import 'package:get/get.dart';

class AuthController extends GetxController {
  final RxString _token = ''.obs;

  void setToken(String value) {
    _token.value = value;
  }
}