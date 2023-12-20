import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:taxiapp/constant/color.dart';
import 'package:taxiapp/controllers/taxi_controllers/taxiorders_controller.dart';
import 'package:taxiapp/core/handlingdataview.dart';
import 'package:taxiapp/data/models/taxi_orders_model.dart';
import 'package:taxiapp/view/pages/taxiDetail/taxidetail.dart';
import 'package:taxiapp/view/widget/TaxiWidgets/taxiorder/taxiorder.dart';


import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';

class TaxiOrders extends StatelessWidget {
  TaxiOrders({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme themeText = Theme.of(context).textTheme;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            toolbarHeight: MediaQuery.of(context).size.height * 0.1,
            title: Text(
              "الطلبات",
              style: themeText.titleLarge,
            ),
            centerTitle: true,
            actions: [
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.015),
                child: Center(
                  // margin: EdgeInsets.only(right: 10),
                  child: Card(
                      elevation: 4,
                      shadowColor: Theme.of(context).colorScheme.shadow,
                      child: Padding(
                        padding: const EdgeInsets.all(13),
                        child: const Icon(
                          Iconsax.refresh,
                          color: AppColor.primary,
                        ),
                      )),
                ),
              )
            ],
          ),
          GetBuilder<TaxiOrdersController>(
            init: TaxiOrdersController(),
            builder: (controller) {
              return HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      final taxiOrderModel =
                          TaxiOrderModel.fromJson(controller.data[index]);
                      return TaxiOrder(
                        onTap: () {
                          Get.to(() => TaxiDetailPage(
                                taxiOrderModel: taxiOrderModel,
                              ));
                        },
                        taxiOrderModel: taxiOrderModel,
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

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        initialCenter: LatLng(
          30,
          40,
        ),
        initialZoom: 9.2,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        ),
        PolylineLayer(
          polylines: [
            Polyline(
              points: [LatLng(30, 40), LatLng(20, 50), LatLng(35, 45)],
              color: Colors.blue,
            ),
          ],
        ),
        RichAttributionWidget(
          attributions: [
            TextSourceAttribution(
              'OpenStreetMap contributors',
              onTap: () =>
                  launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
            ),
          ],
        ),
      ],
    );
  }
}
