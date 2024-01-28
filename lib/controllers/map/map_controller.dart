import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxiapp/data/models/ongoaing_model.dart';
import 'dart:math';

class CustomMapController extends GetxController {
  List<LatLng> facilityCoordinates = [];
  // LatLng(44.12558, 44.2365),
  

  PolylinePoints? polylinePoints = PolylinePoints();
  GoogleMapController? mapController;
  double distance = 0.0;
  String unit = '';

  Set<Marker> markers = Set();
  Map<PolylineId, Polyline> polylines = {};

  List<Marker> sortedMarkers = [];

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos(lat2 - lat1 * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  Future<void> addFacilityCoordinates(OnGoaingOrderModel orderModel,
      FacilityOnGoaingOrderInfo facilityOrderInfo) async {
    LatLng orderModelCoordinate =
        LatLng(orderModel.latitude!, orderModel.longitude!);
    LatLng facilityOrderInfoCoordinate =
        LatLng(facilityOrderInfo.latitude, facilityOrderInfo.longitude);

    if (!facilityCoordinates.contains(orderModelCoordinate)) {
      facilityCoordinates.add(orderModelCoordinate);
    }
    facilityCoordinates.add(facilityOrderInfoCoordinate);

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
  }
}
