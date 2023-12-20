import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:taxiapp/constant/color.dart';
import 'package:taxiapp/controllers/map/panel_controller.dart';
import 'package:taxiapp/data/models/ongoaing_model.dart';
import 'package:taxiapp/view/pages/chat/chat.dart';

import 'package:taxiapp/view/widget/map/mapwidget.dart';
import 'package:taxiapp/view/widget/general/cardIconButton.dart';
import 'package:taxiapp/view/widget/panelwidget.dart';

class MapPage extends StatelessWidget {
  const MapPage({
    super.key,
    required this.onGoaingOrderModel,
  });
  final OnGoaingOrderModel onGoaingOrderModel;

  @override
  Widget build(BuildContext context) {
    final CustomPanelController customPanelController =
        Get.put(CustomPanelController());
    customPanelController.panelHeightOpen =
        MediaQuery.of(context).size.height * .50;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SlidingUpPanel(
              onPanelSlide: (double pos) =>
                  customPanelController.updateFabHeight(pos),
              backdropEnabled: true,
              backdropTapClosesPanel: true,
              backdropOpacity: 0.5,
              maxHeight: customPanelController.panelHeightOpen,
              minHeight: customPanelController.panelHeightClosed,
              controller: customPanelController.panelController,
              parallaxEnabled: true,
              boxShadow: [
                BoxShadow(
                    color: Theme.of(context).colorScheme.shadow,
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 1))
              ],
              parallaxOffset: 0.3,
              color: Theme.of(context).colorScheme.background,
              panelBuilder: (controller) => PanelWidget(
                onClickChat: () {
                  Get.to(() => ChatScreen(
                        onGoaingOrder: onGoaingOrderModel,
                      ));
                },
                onClickDeliverd: () {},
                onClickCancel: () {},
                onGoaingOrderModel: onGoaingOrderModel,
                controller: controller,
                panelController: customPanelController.panelController,
              ),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30),
              ),
              body: Stack(
                children: [
                  customPanelController.loading
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "حساب القيمة والمسافة",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const CircularProgressIndicator(
                                color: AppColor.primary,
                              ),
                            ],
                          ),
                        )
                      : MapboxPolylineExample(),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 10,
                    child: AppBar(
                      backgroundColor: Colors.transparent,
                      centerTitle: true,
                      title: Text("مسار الطلب",style: Theme.of(context).textTheme.titleLarge!,),
                      automaticallyImplyLeading: false,
                      actions: [
                        Padding(
                          padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.01),
                          child: CardIconButtonAppBar(
                            onCLick: () {
                              Get.back();
                            },
                            icon: Icons.arrow_forward_ios_outlined,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Obx(() => Positioned(
                  bottom: customPanelController.fabHeight!.value,
                  child: buildFAB(context, 'km', 12),
                ))
          ],
        ),
      ),
    );
  }
}

Widget buildFAB(BuildContext context, String unit, double distance) {
  return SizedBox(
    width: 120,
    height: 30,
    child: FloatingActionButton(
      onPressed: () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      backgroundColor: AppColor.primary,
      child: Text(
        // distance.toStringAsFixed(1))
        "$unit ${distance.toStringAsFixed(7)}",
        style: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(color: Colors.white, fontSize: 12),
      ),
    ),
  );
}
