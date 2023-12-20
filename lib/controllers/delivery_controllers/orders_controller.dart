import 'package:get/get.dart';
import 'package:taxiapp/controllers/auth/auth_controller.dart';
import 'package:taxiapp/controllers/message/message_controller.dart';

import 'package:taxiapp/core/stateRequset.dart';
import 'package:taxiapp/data/models/orders_model.dart';
import 'package:taxiapp/data/remote/delivery.dart';
import 'package:taxiapp/functions/hundlingdata.dart';
import 'package:taxiapp/view/pages/detail/detailpage.dart';
import 'package:taxiapp/view/widget/general/dialog.dart';

class OrdersControllerImp extends GetxController {
  DelivryOrderPageData orderPageData = DelivryOrderPageData(Get.find());

  final AuthController authController = Get.find<AuthController>();
  

  @override
  void onInit() async {
    statusRequest = StatusRequest.loading;
    String token = authController.token;

    await getData(token);
  
    super.onInit();
  }

  List data = [];
  String? status;
  late StatusRequest statusRequest;

  void navigateToDetailPage(OrderModel orderModel) {
    Get.to(() => DetailPage(orderModel: orderModel),transition: Transition.fade);
  }

  Future checkOrderStatus(id, token) async {
    statusRequest = StatusRequest.loading;
    var response = await orderPageData.getDataStatus(id, token);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      status = response['results'][0]['status'];
    }
  }

  void showDialogOrdersPage() {
    dialog(
 hasCancelButton: false,
      confirmTitle: "المتابعة",
      content:
          "لقد تم أخذ الطلب , يرجى النقر على علامة التحديث اعلاه من اجل الحصول على احدث الطلبات",
      confirmOnClick: () {
        Get.back();
      },
      title: "تم اخذ الطلب مسبقاً",
    );
  }

  Future getData(String token) async {
    statusRequest = StatusRequest.loading;
    var response = await orderPageData.getData(token);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      data = response['results'];
   
    }
    update();
  }
}
