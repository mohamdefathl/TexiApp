import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DistanceCalculator {
  static const String _apiKey = 'AIzaSyDd6KTBqtVuQgTW-rSgGVUUzcJ2C2P1o10';

  static Future<double> calculateDistance(
      LatLng origin, LatLng destination) async {
    final String url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=${origin.latitude},${origin.longitude}&destination=${destination.latitude},${destination.longitude}&mode=walking&key=$_apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body);

      final distanceText =
          decodedData['routes'][0]['legs'][0]['distance']['text'];
      final distanceValue =
          decodedData['routes'][0]['legs'][0]['distance']['value'];

      print('Distance: $distanceText');

      return distanceValue.toDouble();
    } else {
      throw Exception('Failed to calculate distance');
    }
  }
}

// Example usage

class CalculateMap extends StatefulWidget {
  const CalculateMap({super.key});

  @override
  State<CalculateMap> createState() => _CalculateMapState();
}

class _CalculateMapState extends State<CalculateMap> {
  LatLng origin = LatLng(
      15.282007960914436, 44.226211406738514); // Example origin coordinates
  LatLng destination = LatLng(
      15.282804196221251, 44.22927981723555); // Example destination coordinates

  double x = 0;
  @override
  void initState() {
    super.initState();
    calculateDistance();
  }

  bool loading = false;
  void calculateDistance() async {
    setState(() {
      loading = true;
    });
    try {
      final distance =
          await DistanceCalculator.calculateDistance(origin, destination);
      print('Distance in meters: ${distance}');
      print(' Price: ${distance * 0.2}');
      setState(() {
        x = distance;
      });
    } catch (e) {
      print('Error: $e');
    }
    setState(() {
      loading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
