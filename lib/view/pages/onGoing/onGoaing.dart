import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxiapp/controllers/auth/auth_controller.dart';
import 'package:taxiapp/controllers/map/map_controller.dart';
import 'package:taxiapp/controllers/delivery_controllers/ongoaing_controller.dart';
import 'package:taxiapp/core/handlingdataview.dart';
import 'package:taxiapp/data/models/ongoaing_model.dart';
import 'package:taxiapp/view/pages/chat/chat.dart';
import 'package:taxiapp/view/pages/map/mappage.dart';
import 'package:taxiapp/view/widget/general/dialog.dart';
import 'package:taxiapp/view/widget/onGoaing/onGoaingAppbar.dart';
import 'package:taxiapp/view/widget/onGoaing/onGoaingCard.dart';

class OnGoing extends StatelessWidget {
  OnGoing({Key? key}) : super(key: key);
  final CustomMapController mapController = Get.put(CustomMapController());
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    TextTheme themeText = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          onGoaingAppBar(themeText: themeText, authController: authController),
          GetBuilder<OnGoaingController>(
            init: OnGoaingController(),
            builder: (controller) {
              return HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      final onGoaingOrder =
                          OnGoaingOrderModel.fromJson(controller.data[index]);

                      List<LatLng> facilityCoordinates = [
                        LatLng(
                            onGoaingOrder.latitude!, onGoaingOrder.longitude!),
                        ...onGoaingOrder.orderItems!
                            .map((orderItem) => LatLng(
                                  orderItem
                                      .product!.category!.facility!.latitude,
                                  orderItem
                                      .product!.category!.facility!.longitude,
                                ))
                            .toList(),
                      ];
                      facilityCoordinates.sort((a, b) =>
                          calculateHaversineDistance(
                                  LatLng(onGoaingOrder.latitude!,
                                      onGoaingOrder.longitude!),
                                  a)
                              .compareTo(calculateHaversineDistance(
                                  LatLng(onGoaingOrder.latitude!,
                                      onGoaingOrder.longitude!),
                                  b)));
                      mapController.facilityCoordinates = facilityCoordinates;
                      return OnGoaingPageCard(
                        colorScheme: colorScheme,
                        
                        themeText: themeText,
                        onGoaingOrder: onGoaingOrder,
                        mapOnClick: () async {
                          Get.to(
                              () => MapPage(
                                    onGoaingOrderModel: onGoaingOrder,
                                  ),
                              transition: Transition.fade);
                          for (LatLng facilityCoordinate
                              in facilityCoordinates) {
                            print(
                                'Facility Latitude: ${facilityCoordinate.latitude}');
                            print(
                                'Facility Longitude: ${facilityCoordinate.longitude}');
                          }
                        },
                        onClickChat: () {
                          Get.to(
                              () => ChatScreen(
                                    onGoaingOrder: onGoaingOrder,
                                  ),
                              transition: Transition.fade);
                        },
                        onClickDeliverd: () {
                          dialog(
                              hasCancelButton: true,
                              confirmOnClick: () {
                                controller
                                    .updateDeliveryOrder(
                                        onGoaingOrder.id!, 'completed')
                                    .then((value) => Get.back());
                              },
                              confirmTitle: "المتابعة",
                              title: "هل التريد المتابعة",
                              content: 'هل ترغب المتابعة في ايصال الطلب',
                              cancelOnClick: () {
                                Get.back();
                              },
                              cancelTitle: "الغاء");
                        },
                        onClickCancel: () {
                          dialog(
                              hasCancelButton: true,
                              confirmOnClick: () {
                                controller
                                    .updateDeliveryOrder(
                                        onGoaingOrder.id!, 'pending')
                                    .then((value) => Get.back());
                              },
                              confirmTitle: "المتابعة",
                              title: "هل التريد المتابعة",
                              content: 'هل ترغب المتابعة في الغاء الطلب',
                              cancelOnClick: () {
                                Get.back();
                              },
                              cancelTitle: "الغاء");
                        },
                      );
                    },
                    childCount: controller.data.length,
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

double calculateHaversineDistance(LatLng point1, LatLng point2) {
  const earthRadius = 6371.0; // Radius of the Earth in kilometers

  // Convert latitude and longitude from degrees to radians
  double lat1 = radians(point1.latitude);
  double lon1 = radians(point1.longitude);
  double lat2 = radians(point2.latitude);
  double lon2 = radians(point2.longitude);

  // Haversine formula
  double dlat = lat2 - lat1;
  double dlon = lon2 - lon1;
  double a =
      pow(sin(dlat / 2), 2) + cos(lat1) * cos(lat2) * pow(sin(dlon / 2), 2);
  double c = 2 * atan2(sqrt(a), sqrt(1 - a));

  // Calculate distance
  double distance = earthRadius * c;

  return distance;
}

double radians(double degrees) {
  return degrees * (pi / 180.0);
}
