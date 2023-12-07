// import 'package:flutter/material.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'dart:math';

// class CustomMap extends StatefulWidget {
//   const CustomMap({super.key});

//   @override
//   State<CustomMap> createState() => _CustomMapState();
// }

// class _CustomMapState extends State<CustomMap> {
//   GoogleMapController? mapController; //contrller for Google map
//   PolylinePoints polylinePoints = PolylinePoints();

//   String googleAPiKey = "AIzaSyDd6KTBqtVuQgTW-rSgGVUUzcJ2C2P1o10";

//   Set<Marker> markers = Set();
//   Map<PolylineId, Polyline> polylines = {};

//   LatLng startLocation = const LatLng(15.28197970938353, 44.22610531586553);
//   LatLng endLocation = const LatLng(15.285394227827682, 44.218188912728536);
//   LatLng testLocation = const LatLng(15.280608983759269, 44.21560561446241);
//   LatLng lastLocation = const LatLng(15.277600101908286, 44.212204567886985);
//   double distance = 0.0;
//   void addMarker(LatLng markerId, String title, String sinppet) {
//     markers.add(Marker(
//       markerId: MarkerId(markerId.toString()),
//       position: markerId, //position of marker
//       infoWindow: InfoWindow(
//         title: title,
//         snippet: sinppet,
//       ),
//       icon: BitmapDescriptor.defaultMarker, //Icon for Marker
//     ));
//   }

//   @override
//   void initState() {
//     addMarker(startLocation, "start", "Start Marker");
//     addMarker(endLocation, "end", "End Marker");
//     addMarker(testLocation, "test", "Test Marker");    
//     addMarker(lastLocation, "Last", "Last Marker");    
//     getDirections(); //fetch direction polylines from Google API

//     super.initState();
//   }

//   getDirections() async {
//     List<LatLng> polylineCoordinates = [];

//     PolylineResult result1 = await polylinePoints.getRouteBetweenCoordinates(
//       googleAPiKey,
//       PointLatLng(startLocation.latitude, startLocation.longitude),
//       PointLatLng(testLocation.latitude, testLocation.longitude),
//       travelMode: TravelMode.walking,
//     );

//     PolylineResult result2 = await polylinePoints.getRouteBetweenCoordinates(
//       googleAPiKey,
//       PointLatLng(testLocation.latitude, testLocation.longitude),
//       PointLatLng(endLocation.latitude, endLocation.longitude),
//       travelMode: TravelMode.walking,
//     );
//     PolylineResult result3 = await polylinePoints.getRouteBetweenCoordinates(
//       googleAPiKey,
//       PointLatLng(endLocation.latitude, endLocation.longitude),
//       PointLatLng(lastLocation.latitude, lastLocation.longitude),
//       travelMode: TravelMode.walking,
//     );

//     if (result1.points.isNotEmpty && result2.points.isNotEmpty && result3.points.isNotEmpty) {
//       result1.points.forEach((PointLatLng point) {
//         polylineCoordinates.add(LatLng(point.latitude, point.longitude));
//       });

//       result2.points.forEach((PointLatLng point) {
//         polylineCoordinates.add(LatLng(point.latitude, point.longitude));
//       });
//       result3.points.forEach((PointLatLng point) {
//         polylineCoordinates.add(LatLng(point.latitude, point.longitude));
//       });
//     } else {
//       print(result1.errorMessage);
//       print(result2.errorMessage);
//     }

//     double totalDistance = 0;
//     for (var i = 0; i < polylineCoordinates.length - 1; i++) {
//       totalDistance += calculateDistance(
//           polylineCoordinates[i].latitude,
//           polylineCoordinates[i].longitude,
//           polylineCoordinates[i + 1].latitude,
//           polylineCoordinates[i + 1].longitude);
//     }
//     print(totalDistance);

//     setState(() {
//       distance = totalDistance;
//     });

//     addPolyLine(polylineCoordinates);
//   }

//   addPolyLine(List<LatLng> polylineCoordinates) {
//     PolylineId id = PolylineId("poly");
//     Polyline polyline = Polyline(
//       polylineId: id,
//       color: Colors.deepPurpleAccent,
//       points: polylineCoordinates,
//       width: 8,
//     );
//     polylines[id] = polyline;
//     setState(() {});
//   }

//   double calculateDistance(lat1, lon1, lat2, lon2) {
//     var p = 0.017453292519943295;
//     var a = 0.5 -
//         cos((lat2 - lat1) * p) / 2 +
//         cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
//     return 12742 * asin(sqrt(a));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         floatingActionButton: FloatingActionButton(onPressed: () {
//           print(distance);
//         }),
//         body: Stack(children: [
//           GoogleMap(
//             //Map widget from google_maps_flutter package
//             zoomGesturesEnabled: true,
//             initialCameraPosition: CameraPosition(
//               //innital position in map
//               target: startLocation, //initial position
//               zoom: 14.0, //initial zoom level
//             ),
//             markers: markers, //markers to show on map
//             polylines: Set<Polyline>.of(polylines.values), //polylines
//             mapType: MapType.normal, //map type
//             onMapCreated: (controller) {
//               //method called when map is created
//               setState(() {
//                 mapController = controller;
//               });
//             },
//           ),
//           Positioned(
//               bottom: 200,
//               left: 0,
//               child: Container(
//                   child: Card(
//                 child: Container(
//                     padding: EdgeInsets.all(20),
//                     child: Text(
//                         "Total Distance: " +
//                             (distance * 1000).toString() +
//                             " KM",
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold))),
//               ))),
//           Positioned(
//               bottom: 100,
//               left: 0,
//               child: Container(
//                   child: Card(
//                 child: Container(
//                     padding: EdgeInsets.all(20),
//                     child: Text(
//                         "Total Cost: " +
//                             (distance * 1000 * 0.2).toString() +
//                             " ريال",
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold))),
//               )))
//         ]));
//   }
// }