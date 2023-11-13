import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math';

import 'package:taxiapp/constant/color.dart';
import 'package:taxiapp/constant/google_mapStyle.dart';

class CustomMap extends StatefulWidget {
  const CustomMap({super.key});

  @override
  State<CustomMap> createState() => _CustomMapState();
}

class _CustomMapState extends State<CustomMap> {
  GoogleMapController? mapController;

  PolylinePoints polylinePoints = PolylinePoints();

  String googleAPiKey = "AIzaSyDd6KTBqtVuQgTW-rSgGVUUzcJ2C2P1o10";

  Set<Marker> markers = Set();
  Map<PolylineId, Polyline> polylines = {};

  LatLng startLocation = const LatLng(15.28197970938353, 44.22610531586553);
  LatLng testLocation = const LatLng(15.285394227827682, 44.218188912728536);
  LatLng endLocation = const LatLng(15.280608983759269, 44.21560561446241);
  LatLng lastLocation = const LatLng(15.278327583147746, 44.22527021354437);
  LatLng newLocation = const LatLng(15.281929240365063, 44.22926941143975);
  double distance = 0.0;

  List<Marker> sortedMarkers = [];

  void addMarker(LatLng markerId, String title, String snippet) {
    markers.add(
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
    addMarker(startLocation, "start", "Start Marker");
    addMarker(endLocation, "end", "End Marker");
    addMarker(testLocation, "test", "Test Marker");
    addMarker(lastLocation, "Last", "Last Marker");
    addMarker(newLocation, "Last", "Last Marker");
    getDirections();

    super.initState();
  }

  bool loading = false;
  Future<void> getDirections() async {
    setState(() {
      loading = true;
    });
    List<LatLng> polylineCoordinates = [];

    List<Marker> unsortedMarkers = markers.toList();
    unsortedMarkers.sort((a, b) {
      double distanceA = calculateDistance(
        startLocation.latitude,
        startLocation.longitude,
        a.position.latitude,
        a.position.longitude,
      );
      double distanceB = calculateDistance(
        startLocation.latitude,
        startLocation.longitude,
        b.position.latitude,
        b.position.longitude,
      );
      return distanceA.compareTo(distanceB);
    });

    sortedMarkers = unsortedMarkers;

    for (int i = 0; i < sortedMarkers.length - 1; i++) {
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleAPiKey,
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
        distance = totalDistance;
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
    polylines[id] = polyline;
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
    return (distance * 1000 * 0.2).toStringAsFixed(1);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        loading
            ? Column(
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
              )
            : GoogleMap(
              zoomGesturesEnabled: true,
              initialCameraPosition: CameraPosition(
                target: startLocation,
                zoom: 14.0,
              ),
              markers: markers,
              polylines: Set<Polyline>.of(polylines.values),
              mapType: MapType.normal,
              onMapCreated: (controller) {
                setState(() {
                  mapController = controller;
                  mapController!.setMapStyle(mapstyle);
                });
              },
            ),
        Positioned(
          bottom: 30,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Card(
                  child: Container(
                    decoration: BoxDecoration(color: AppColor.blackSecond),
                    padding: EdgeInsets.all(4),
                    child: Text(
                      "المسافة:  ${(distance * 1000).toStringAsFixed(1)}",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
              ),
              Container(
                child: Card(
                  child: Container(
                    decoration: BoxDecoration(color: AppColor.blackSecond),
                    padding: EdgeInsets.all(4),
                    child: Text(
                      "تكلفة النقل: " + calculateCost() + " ريال",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
