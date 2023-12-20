import 'dart:convert';
import 'package:osrm/osrm.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'dart:math';

double calculateDistance(
    double startLat, double startLng, double endLat, double endLng) {
  const double earthRadius = 6371; // in kilometers

  double dLat = _toRadians(endLat - startLat);
  double dLng = _toRadians(endLng - startLng);

  double a = sin(dLat / 2) * sin(dLat / 2) +
      cos(_toRadians(startLat)) *
          cos(_toRadians(endLat)) *
          sin(dLng / 2) *
          sin(dLng / 2);

  double c = 2 * atan2(sqrt(a), sqrt(1 - a));

  double distance = earthRadius * c;
  return distance;
}

double _toRadians(double degree) {
  return degree * (pi / 180);
}

double distance = calculateDistance(15.282007960914436, 44.226211406738514,
    15.282804196221251, 44.22927981723555);

//   }

Future<double> suckMy(LatLng start, LatLng end) async {
  final String osrmEndpoint =
      'http://your_osrm_server_ip:5000/route/v1/driving/${start.longitude},${start.latitude};${end.longitude},${end.latitude}?steps=true';

  try {
    final http.Response response = await http.get(Uri.parse(osrmEndpoint));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      // Parse the response and extract distance information
      double distance = data['routes'][0]['distance'].toDouble();
      print(distance);
      return distance;
    } else {
      throw Exception('Failed to load route data');
    }
  } catch (e) {
    print('Error: $e');
    throw Exception('Failed to connect to the OSRM server');
  }
}

class CalculateMap extends StatefulWidget {
  const CalculateMap({super.key});

  @override
  State<CalculateMap> createState() => _CalculateMapState();
}

class _CalculateMapState extends State<CalculateMap> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(distance.toString()),
            ElevatedButton(
                onPressed: () async {
                  // suckMy(LatLng(15.282804196221251, 44.22927981723555),
                  //     LatLng(   15.282007960914436, 44.226211406738514));
                  {
                    final osrm = Osrm();

                    final options = RouteRequest(
                      coordinates: [
                        (15.282804196221251, 44.22927981723555),
                        (15.282007960914436, 44.226211406738514),
                      ],
                    );

                    final route = await osrm.route(options);
                    final droute = await osrm.source;
                    
                    print(droute);
                  }
                },
                child: Text("data"))
          ],
        ),
      ),
    );
  }
}
