import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxiapp/data/models/orders_model.dart';
import 'dart:math';

class CustomMapController extends GetxController {
  List<LatLng> facilityCoordinates = [
    // LatLng(15.278560850410106, 44.23328695839224),
    // LatLng(15.281667559329007, 44.231069628454556),
    // LatLng(15.282110351110669, 44.22617873444678),
    // LatLng(15.277884983757328, 44.22516603735002),
  ];

  PolylinePoints? polylinePoints = PolylinePoints();
  GoogleMapController? mapController;
  double distance = 0.0;
  final String googleAPiKey = "AIzaSyDd6KTBqtVuQgTW-rSgGVUUzcJ2C2P1o10";

  Set<Marker> markers = Set();
  Map<PolylineId, Polyline> polylines = {};

  List<Marker> sortedMarkers = [];

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  void addFacilityCoordinates(
      OrderModel orderModel, FacilityOrderInfo facilityOrderInfo) {
    LatLng orderModelCoordinate =
        LatLng(orderModel.latitude!, orderModel.longitude!);
    LatLng facilityOrderInfoCoordinate =
        LatLng(facilityOrderInfo.latitude, facilityOrderInfo.longitude);

    if (!facilityCoordinates.contains(orderModelCoordinate)) {
      facilityCoordinates.add(orderModelCoordinate);
    }
    facilityCoordinates.add(facilityOrderInfoCoordinate);
    print(facilityCoordinates);

    facilityCoordinates.sort((a, b) {
      double distanceA = calculateDistance(
        orderModel.latitude!,
        orderModel.longitude!,
        a.latitude,
        a.longitude,
      );
      double distanceB = calculateDistance(
        orderModel.latitude!,
        orderModel.longitude!,
        b.latitude,
        b.longitude,
      );
      return distanceA.compareTo(distanceB);
    });

    update();
  }
}
