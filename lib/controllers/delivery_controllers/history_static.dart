import 'package:get/get.dart';
import 'package:taxiapp/controllers/auth/auth_controller.dart';

import 'package:taxiapp/core/stateRequset.dart';
import 'package:taxiapp/data/remote/history.dart';
import 'package:taxiapp/functions/hundlingdata.dart';

class HistoryControllerStatic extends GetxController {
  HistoryPageData historyPageData = HistoryPageData(Get.find());
  final AuthController authController = Get.find<AuthController>();
  List data = [];
  int ?day;
  int ?month;
  int ?year;

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
    var response = await historyPageData.getDataStatics(token);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      data = response['results'];      
      day= data[0]['day'];
    }
    update();
  }

  
}
