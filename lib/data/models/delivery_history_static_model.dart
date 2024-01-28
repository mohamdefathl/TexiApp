class DeliveryOrdersStatics {
  final int day;
  final int mounth;
  final int year;

  DeliveryOrdersStatics({
    required this.day,
    required this.mounth,
    required this.year,
  });

  factory DeliveryOrdersStatics.fromJson(Map<String, dynamic> json) {
    return DeliveryOrdersStatics(
      day: json['day'],
      mounth: json['month'],
      year: json['year'],
    );
  }
}
