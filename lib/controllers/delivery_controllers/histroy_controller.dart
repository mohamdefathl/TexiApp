import 'package:get/get.dart';
import 'package:taxiapp/controllers/auth/auth_controller.dart';

import 'package:taxiapp/core/stateRequset.dart';
import 'package:taxiapp/data/remote/history.dart';
import 'package:taxiapp/functions/hundlingdata.dart';

class HistoryController extends GetxController {
  HistoryPageData historyPageData = HistoryPageData(Get.find());
  final AuthController authController = Get.find<AuthController>();
  List data = [];

  late StatusRequest statusRequest;

  List data2 = [];

  late StatusRequest statusRequest2;

  @override
  void onInit() async {
    statusRequest = StatusRequest.loading;
    statusRequest2 = StatusRequest.loading;
    String token = authController.token;

    await getDataStatics(token);
    await getData(token);
    super.onInit();
  }

  Future getData(String token) async {
    statusRequest = StatusRequest.loading;
    var response = await historyPageData.getData(token);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      data = response['results'];
      // print("DATA ! $data");
    }
    update();
  }

  Future getDataStatics(String token) async {
    statusRequest2 = StatusRequest.loading;

    var response = await historyPageData.getDataStatics(token);
    statusRequest2 = handlingData(response);
    if (statusRequest2 == StatusRequest.success) {
      data2 = response['results'];
      print(data2[0]["day"]);
    }
    update();
  }
}
