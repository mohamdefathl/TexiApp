import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import './locationSetup.dart';
class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  // var x;
  // var cl;
  // Future getPostion() async {
  //   LocationPermission? per;
  //   bool sercives;
  //   sercives = await Geolocator.isLocationServiceEnabled();

  //   if (sercives) {
  //     x = 'hi';
  //   } else {
  //     x = 'hello';
  //   }
  //   per = await Geolocator.checkPermission();

  //   if (per == LocationPermission.denied) {
  //     per = await Geolocator.requestPermission();
  //     print('denied');
  //     if (per == LocationPermission.always) {
  //       print('always');
  //       getLangAndLong();
  //     }
  //   }

  //   print(sercives);
  //   print(per);
  // }

  // Future<Position> getLangAndLong() async {
  //   return await Geolocator.getCurrentPosition().then((value) => value);
  // }

  @override
  void initState() {
    getPermission();
    // isLocationOn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
            child: ElevatedButton(
                onPressed: () {
                  print("HI : ");
                },
                child: Text("presdqwdqws me")),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () async {
                  // cl = await getLangAndLong();
                  // print(cl.toString());
                  // List<Placemark> placemarks = await placemarkFromCoordinates(cl.latitude, cl.longitude);
                  // print(placemarks.toString());
                  double distanceInMeters = Geolocator.distanceBetween(
                      15.290051, 44.203654, 15.301256, 44.159920);
                  double distance = distanceInMeters / 1000;
                  print(distance);
                },
                child: Text("press me")),
          )
        ]),
      ),
    );
  }
}
