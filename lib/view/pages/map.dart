import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    // double x = lf.distanceBetween(15.28389593687434, 44.227034740994306,
    //     15.282852769643963, 44.22937627408203, "meters");
    // double y = Geolocator.distanceBetween(
    //15.28389593687434,
    //44.227034740994306,
    //15.282852769643963,
    // 44.22937627408203);
    Future<List<Placemark>?> geoPlaceByLatLong(lat, long) async {
      List<Placemark> placemark = await placemarkFromCoordinates(lat, long);
    }

    double startLatitude = 15.28389593687434;
    double startLongitude = 44.227034740994306;
    double destinationLatitude = 15.282852769643963;
    double destinationLongitude = 44.22937627408203;
    var x;

    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            geoPlaceByLatLong(13.3, 11.4);
            // print(x.);
          },
          child: Text('x'),
        ),
        Text("X")
      ],
    ));
  }
}
