import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:taxiapp/core/stateRequset.dart';
import 'package:taxiapp/data/models/orders_model.dart';
import 'package:taxiapp/data/remote/facilitypage_data_data.dart';
import 'package:taxiapp/functions/hundlingdata.dart';
import 'package:taxiapp/view/pages/detail/detailpage.dart';
import 'package:taxiapp/view/widget/general/dialog.dart';

class OrdersControllerImp extends GetxController {
  OrderPageData orderPageData = OrderPageData(Get.find());

  List data = [];
  String? status;
  late StatusRequest statusRequest;
  Map<dynamic, List<OrderItem>>? groupedProducts;

  void navigateToDetailPage(OrderModel orderModel) {
    Get.to(() => DetailPage(orderModel: orderModel));
  }

  // void groupFacilityWithProduct(OrderModel orderModel) {
  //   groupedProducts = groupBy(
  //     orderModel.orderItems!,
  //     (product) => product.product!.category!.facility!.id,
  //   );
  //   // orderModel.groupedProductsLength = groupedProducts!.length;
  //   // print(orderModel.groupedProductsLength);

  //   update([orderModel]);
  // }

  Future checkOrderStatus(id) async {
    statusRequest = StatusRequest.loading;
    var response = await orderPageData.getDataStatus(id);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      status = response['results'][0]['status'];
    }
  }

  void showDialogOrdersPage() {
    dialog(
      buttonTitle: "المتابعة",
      content:
          "لقد تم أخذ الطلب , يرجى النقر على علامة التحديث اعلاه من اجل الحصول على احدث الطلبات",
      onPress: () {
        Get.back();
      },
      title: "تم اخذ الطلب مسبقاً",
    );
  }

  Future getData() async {
    statusRequest = StatusRequest.loading;
    var response = await orderPageData.getData();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      data = response['results'];
      // print(data);
    }
    update();
  }

  @override
  void onInit() async {
    statusRequest = StatusRequest.loading;
    await getData();
    super.onInit();
  }
}
