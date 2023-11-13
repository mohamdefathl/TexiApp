import 'package:geolocator/geolocator.dart';

Future getPermission() async {
  LocationPermission? permission;
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
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
    // isLocationOn = await Geolocator.openLocationSettings();    
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
// Future getPostion() async {
//   LocationPermission? permission;
//   bool sercives;
//   sercives = await Geolocator.isLocationServiceEnabled();

//   permission = await Geolocator.checkPermission();

//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     print('denied');
//     if (permission == LocationPermission.always ||
//         permission == LocationPermission.whileInUse) {
//       print('always');
//       getLangAndLong();
//     }
//   }

//   print(sercives);
//   print(permission);
// }

Future<Position> getLangAndLong() async {
  return await Geolocator.getCurrentPosition().then((value) => value);
}
