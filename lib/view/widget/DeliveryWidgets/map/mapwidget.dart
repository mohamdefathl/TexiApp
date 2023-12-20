import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:taxiapp/constant/google_mapStyle.dart';
import 'package:taxiapp/controllers/map/map_controller.dart';
import 'package:geolocator/geolocator.dart';

class MapboxPolylineExample extends StatefulWidget {
  const MapboxPolylineExample({
    super.key,
  });

  @override
  _MapboxPolylineExampleState createState() => _MapboxPolylineExampleState();
}

class _MapboxPolylineExampleState extends State<MapboxPolylineExample> {
  final CustomMapController customMapController =
      Get.put(CustomMapController());
  GoogleMapController? mapController;
  List<LatLng> polylinePoints = [];
  List<Marker> markers = [];
  bool loading = false;

  @override
  void initState() {
    super.initState();
    setCustomMarker();
    fetchPolyline();
  }

  Future<void> fetchPolyline() async {
    loading = true;
    const String mapboxAccessToken =
        'pk.eyJ1IjoibW9oYW1lZGZhdGhsMSIsImEiOiJjbHEzbWk4bjcwMWlnMmtvOGxrdDA1bWw0In0._1-fNp3XkCHpruRUgUBhzA';
    const String mapboxDirectionsApiUrl =
        'https://api.mapbox.com/directions/v5/mapbox/walking/';

    final List<String> coordinates = customMapController.facilityCoordinates
        .map((latLng) => '${latLng.longitude},${latLng.latitude}')
        .toList();

    final String apiUrl =
        '$mapboxDirectionsApiUrl${coordinates.join(';')}?overview=full&geometries=geojson&access_token=$mapboxAccessToken';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final decodedResponse = json.decode(response.body);

      final List<dynamic> routeGeometry =
          decodedResponse['routes'][0]['geometry']['coordinates'];

      setState(() {
        polylinePoints =
            routeGeometry.map((point) => LatLng(point[1], point[0])).toList();

        markers = customMapController.facilityCoordinates
            .map(
              (latLng) => Marker(
                markerId: MarkerId(latLng.toString()),
                position: latLng,
                infoWindow: InfoWindow(title: 'Marker'),
                icon: source,
              ),
            )
            .toList();
      });
      loading = false;
    } else {
      throw Exception('Failed to fetch polyline');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            )
          : GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
                Get.isDarkMode ? mapController!.setMapStyle(mapstyle) : null;
              },
              initialCameraPosition: CameraPosition(
                target: customMapController.facilityCoordinates[0],
                zoom: 15.0,
              ),
              markers: Set<Marker>.from(markers),
              polylines: Set<Polyline>.from([
                Polyline(
                  polylineId: PolylineId('route'),
                  points: polylinePoints,
                  color: Colors.blue,
                  width: 5,
                ),
              ]),
            ),
    );
  }
}

void setCustomMarker() {
  BitmapDescriptor.fromAssetImage(
          ImageConfiguration.empty, "assets/images/location.png")
      .then((value) => source = value);
}

BitmapDescriptor source = BitmapDescriptor.defaultMarker;
