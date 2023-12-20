import 'package:geolocator/geolocator.dart';

Future getPermission() async {
  LocationPermission? permission;
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied ||permission == LocationPermission.deniedForever ) {
    permission = await Geolocator.requestPermission();
    // isLocationOn();
  } else {
    isLocationOn();
  }
}

Future isLocationOn() async {
  bool isLocationOn;
  isLocationOn = await Geolocator.isLocationServiceEnabled();
  if (!isLocationOn) {    
    getPosion();
  } else {
    getPosion();
  }
}

Future getPosion() async {
  Position position;
  position = await Geolocator.getCurrentPosition();
  print(position);
}

Future<Position> getLangAndLong() async {
  return await Geolocator.getCurrentPosition().then((value) => value);
}
