import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:taxiapp/controllers/delivery_controllers/detailpage_controller.dart';
import 'package:taxiapp/controllers/home_controlle.dart';
import 'package:taxiapp/data/models/orders_model.dart';
import 'package:taxiapp/view/widget/general/home.dart';

class DetailPageTakeOrderButton extends StatelessWidget {
  DetailPageTakeOrderButton({
    super.key,
    required this.orderModel,
  });

  final OrderModel orderModel;
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<DetailPageController>(
            init: DetailPageController(),
            builder: (_) {
              return SlideAction(
                reversed: true,
                text: "أخذ الطلب",
                height: 60,
                sliderRotate: false,
                sliderButtonIconSize: 20,
                textStyle: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Theme.of(context).colorScheme.tertiary),
                outerColor: Theme.of(context).colorScheme.outline,
                innerColor: Theme.of(context).colorScheme.tertiary,
                onSubmit: () async {
                  await _.updateDeliveryOrder(orderModel.id!);
                  
                  Get.offAll(() => Home(), transition: Transition.fadeIn);
                  homeController.onItemTapped(2);
                },
              );
            },
          ),
        );
      },
    );
  }
}
