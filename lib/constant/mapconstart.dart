import 'dart:math';

class LatLng {
  double latitude;
  double longitude;

  LatLng(this.latitude, this.longitude);
}

double calculateDistance(LatLng start, LatLng end) {
  const double earthRadius = 6371; // Earth's radius in kilometers

  double lat1 = start.latitude * pi / 180;
  double lon1 = start.longitude * pi / 180;
  double lat2 = end.latitude * pi / 180;
  double lon2 = end.longitude * pi / 180;

  double dLat = lat2 - lat1;
  double dLon = lon2 - lon1;

  double a = sin(dLat / 2) * sin(dLat / 2) +
      cos(lat1) * cos(lat2) * sin(dLon / 2) * sin(dLon / 2);

  double c = 2 * atan2(sqrt(a), sqrt(1 - a));

  return earthRadius * c;
}

void orderLocationByNearest() {
  LatLng startLocation = LatLng(15.28197970938353, 44.22610531586553);
  List<LatLng> locations = [
    LatLng(15.285394227827682, 44.218188912728536),
    LatLng(15.280608983759269, 44.21560561446241),
    LatLng(15.277600101908286, 44.212204567886985),
  ];

  locations.sort((a, b) {
    double distanceA = calculateDistance(startLocation, a);
    double distanceB = calculateDistance(startLocation, b);
    return distanceA.compareTo(distanceB);
  });

  for (var location in locations) {
    print("Distance to location: ${calculateDistance(startLocation, location)}");
  }
}

