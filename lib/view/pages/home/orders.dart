import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:taxiapp/constant/color.dart';
import 'package:taxiapp/controllers/orders_controller.dart';
import 'package:taxiapp/core/handlingdataview.dart';
import 'package:taxiapp/data/models/orders_model.dart';
import 'package:taxiapp/view/widget/general/cardIconButton.dart';
import 'package:taxiapp/view/widget/home/order.dart';

class Orders extends StatelessWidget {
  Orders({Key? key});

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
                  elevation: 4,
                  shadowColor: Theme.of(context).colorScheme.shadow,
                  child: GetBuilder<OrdersControllerImp>(
                    init: OrdersControllerImp(),
                    builder: (controller) {
                      return Padding(
                        padding: const EdgeInsets.all(13),
                        child: GestureDetector(
                          onTap: () {
                            Get.dialog(const Center(
                              child: CircularProgressIndicator(
                                  color: AppColor.primary),
                            ));
                            controller.getData().then((_) => Get.back());
                          },
                          child: const Icon(
                            Iconsax.refresh,
                            color: AppColor.primary,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            elevation: 0.0,
            pinned: false,
            snap: true,
            floating: true,
            stretch: true,
          ),
          GetBuilder<OrdersControllerImp>(
            // init: OrdersControllerImp(),
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
                        onTap: () {
                          // showDialog(
                          //   context: context,
                          //   builder: (BuildContext context) {
                          //     return const Center(
                          //       child: CircularProgressIndicator(),
                          //     );
                          //   },
                          // );
                          Get.dialog(const Center(
                            child: CircularProgressIndicator(
                                color: AppColor.primary),
                          ));
                          // content: const Center(
                          // child: CircularProgressIndicator(),
                          controller.checkOrderStatus(orderModel.id).then((_) {
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
