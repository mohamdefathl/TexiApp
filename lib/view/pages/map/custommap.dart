import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'dart:math';

import 'package:taxiapp/constant/color.dart';
import 'package:taxiapp/constant/google_mapStyle.dart';
import 'package:taxiapp/controllers/map_controller.dart';
import 'package:taxiapp/view/widget/general/cardIconButton.dart';
import 'package:taxiapp/view/widget/panelwidget.dart';

class CustomMap extends StatefulWidget {
  const CustomMap({super.key});

  @override
  State<CustomMap> createState() => _CustomMapState();
}

class _CustomMapState extends State<CustomMap> {
  final panelController = PanelController();
  final CustomMapController customMapController =
      Get.find<CustomMapController>();

  List<Marker> sortedMarkers = [];

  void addMarker(LatLng markerId, String title, String snippet) {
    customMapController.markers.add(
      Marker(
        markerId: MarkerId(markerId.toString()),
        position: markerId,
        infoWindow: InfoWindow(
          title: title,
          snippet: snippet,
        ),
        icon: BitmapDescriptor.defaultMarker,
      ),
    );
  }

  @override
  void initState() {
    for (int i = 0; i < customMapController.facilityCoordinates.length; i++) {
      LatLng facilityCoordinate = customMapController.facilityCoordinates[i];
      addMarker(facilityCoordinate, "نقطة ${i + 1}", "");
    }
    getDirections();

    super.initState();
  }

  bool loading = false;
  Future<void> getDirections() async {
    setState(() {
      loading = true;
    });
    List<LatLng> polylineCoordinates = [];

    List<Marker> unsortedMarkers = customMapController.markers.toList();

    sortedMarkers = unsortedMarkers;

    for (int i = 0; i < sortedMarkers.length - 1; i++) {
      PolylineResult result =
          await customMapController.polylinePoints!.getRouteBetweenCoordinates(
        customMapController.googleAPiKey,
        PointLatLng(
          sortedMarkers[i].position.latitude,
          sortedMarkers[i].position.longitude,
        ),
        PointLatLng(
          sortedMarkers[i + 1].position.latitude,
          sortedMarkers[i + 1].position.longitude,
        ),
        travelMode: TravelMode.walking,
      );

      if (result.points.isNotEmpty) {
        result.points.forEach((PointLatLng point) {
          polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        });
      } else {
        print(result.errorMessage);
      }
    }

    double totalDistance = 0;
    for (int i = 0; i < polylineCoordinates.length - 1; i++) {
      totalDistance += calculateDistance(
        polylineCoordinates[i].latitude,
        polylineCoordinates[i].longitude,
        polylineCoordinates[i + 1].latitude,
        polylineCoordinates[i + 1].longitude,
      );
    }

    try {
      setState(() {
        customMapController.distance = totalDistance;
      });
    } catch (e) {}

    addPolyLine(polylineCoordinates);
    try {
      setState(() {
        loading = false;
      });
    } catch (e) {}
  }

  void addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: AppColor.primary,
      points: polylineCoordinates,
      width: 8,
    );
    customMapController.polylines[id] = polyline;
    try {
      setState(() {});
    } catch (e) {}
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  String calculateCost() {
    return (customMapController.distance * 1000 * 0.2).toStringAsFixed(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.blackSecond,
        toolbarHeight: 0,
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){}),
      // bottomSheet: ,
      // bottomSheet: Container(
      //   // padding: EdgeInsets.symmetric(horizontal: 10),
      //   // margin: EdgeInsets.symmetric(horizontal: 10),
      //   decoration: BoxDecoration(
      //     // color: Colors.red,
      //     borderRadius: BorderRadius.only(

      //       topLeft: Radius.circular(40),
      //       topRight: Radius.circular(40),
      //     ),
      //   ),
      // ),
      body: SlidingUpPanel(
        backdropEnabled: true,
        backdropTapClosesPanel: true,
        backdropOpacity: 0.5,
        minHeight: MediaQuery.of(context).size.height * 0.1,
        maxHeight: MediaQuery.of(context).size.height * 0.5,
        controller: panelController,
        parallaxEnabled: true,
        boxShadow: [
              BoxShadow(
                  color: Theme.of(context).colorScheme.shadow,
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: Offset(0, 1))
            ],
        parallaxOffset: 0.3,
        color: Color(0xff363536),
        panelBuilder: (controller) => PanelWidget(
          controller: controller,
          panelController: panelController,
        ),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        body: Stack(
          children: [
            
            loading
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
                : GoogleMap(
                    zoomGesturesEnabled: true,
                    initialCameraPosition: CameraPosition(
                      target: customMapController.facilityCoordinates[0],
                      zoom: 14.0,
                    ),
                    markers: customMapController.markers,
                    polylines:
                        Set<Polyline>.of(customMapController.polylines.values),
                    mapType: MapType.normal,
                    onMapCreated: (controller) {
                      setState(() {
                        customMapController.mapController = controller;
                        customMapController.mapController!
                            .setMapStyle(mapstyle);
                      });
                    },
                  ),
                  
            Positioned(
              width: MediaQuery.of(context).size.width,
              top: 10,
              child: Text(
                "موقع الطلب",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white),
              ),
            ),

            Positioned(
              right: 10,
              top: 10,
              child: CardIconButtonAppBar(
                icon: Icons.arrow_forward_ios_rounded,
                onCLick: () {
                  Get.back();
                },
              ),
            ),
            // Positioned(
            //   left: 10,
            //   right: 10,
            //   // top: 20,
            //   // width: MediaQuery.of(context).size.width * 0.9,
            //   bottom: 00,
            //   height: MediaQuery.of(context).size.height * 0.3,
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: Color(0xff363536),
            //       borderRadius: BorderRadius.only(
            //         topLeft: Radius.circular(40),
            //         topRight: Radius.circular(40),
            //       ),
            //     ),
            //     child: Center(child: Text("data")),
            //   ),
            // )
            // Positioned(
            //   bottom: 30,
            //   child: Column(
            //     // mainAxisAlignment: MainAxisAlignment.center,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       Card(
            //         child: Container(
            //           // decoration: BoxDecoration(color: AppColor.dark),
            //           padding: EdgeInsets.all(4),
            //           child: Text(
            //             "المسافة:  ${(customMapController.distance * 1000).toStringAsFixed(1)}",
            //             style: Theme.of(context).textTheme.titleMedium,
            //           ),
            //         ),
            //       ),
            //       Container(
            //         child: Card(
            //           child: Container(
            //             // decoration: BoxDecoration(color: AppColor.dark),
            //             padding: EdgeInsets.all(4),
            //             child: Text(
            //               "تكلفة النقل: " + calculateCost() + " ريال",
            //               style: Theme.of(context).textTheme.titleMedium,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
