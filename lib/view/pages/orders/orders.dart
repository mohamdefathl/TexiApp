import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:taxiapp/constant/color.dart';
import 'package:taxiapp/controllers/auth/auth_controller.dart';
import 'package:taxiapp/controllers/message/message_controller.dart';
import 'package:taxiapp/controllers/delivery_controllers/orders_controller.dart';
import 'package:taxiapp/core/handlingdataview.dart';
import 'package:taxiapp/data/models/orders_model.dart';
import 'package:taxiapp/view/widget/general/cardIconButton.dart';
import 'package:taxiapp/view/widget/orders/order.dart';

class Orders extends StatelessWidget {
  Orders({Key? key}) : super(key: key);
  final AuthController authController = Get.find<AuthController>();
  final MessageingController messageingController =
      Get.put(MessageingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: MediaQuery.of(context).size.height * 0.1,
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CardIconButtonAppBar(
                  onCLick: () {},
                  icon: Iconsax.search_normal,
                ),
                Text(
                  "الطلبات",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Card(
                    
                    shadowColor: Theme.of(context).colorScheme.shadow,
                    child: Padding(
                      padding: const EdgeInsets.all(13),
                      child: GetBuilder<OrdersControllerImp>(
                        init: OrdersControllerImp(),
                        builder: (controller) {
                          return GestureDetector(
                            onTap: () {
                              Get.dialog(const Center(
                                child: CircularProgressIndicator(
                                    color: AppColor.primary),
                              ));
                              controller
                                  .getData(authController.token)
                                  .then((_) => Get.back());
                            },
                            child: const Icon(
                              Iconsax.refresh,
                              color: AppColor.primary,
                            ),
                          );
                        },
                      ),
                    )),
              ],
            ),
            elevation: 0.0,
            pinned: false,
            snap: true,
            floating: true,
            stretch: true,
          ),
          GetBuilder<OrdersControllerImp>(
            builder: (controller) {
              return HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      final orderModel =
                          OrderModel.fromJson(controller.data[index]);

                      return Order(
                        len: orderModel.groupedOrderItems!.length,
                        orderModel: orderModel,
                        onTap: () async {
                          Get.dialog(const Center(
                            child: CircularProgressIndicator(
                                color: AppColor.primary),
                          ));
                          // await messageingController
                          //     .sendDeliveryMessageToken(orderModel.codeNumber!);
                          // await messageingController
                          //     .getCustomerMessageToken(orderModel.codeNumber!);

                          controller
                              .checkOrderStatus(
                                  orderModel.id, authController.token)
                              .then((_) {
                            Get.back();
                            if (controller.status == 'pending') {
                              controller.navigateToDetailPage(
                                OrderModel.fromJson(controller.data[index]),
                              );
                            } else {
                              controller.showDialogOrdersPage();
                            }
                          });
                        },
                      );
                    },
                    childCount: controller.data.length,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
