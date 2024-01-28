class DeliveryHistoryModel {
  final Customer customer;
  final List<Facility> facilities; 
  final String codeNumber;
  final String shippingCost;
  final String address;
  final DateTime doneDeliveryDate;
  final DateTime createdAt;

  DeliveryHistoryModel({
    required this.customer,
    required this.facilities, 
    required this.codeNumber,
    required this.address,

    required this.shippingCost,
    required this.doneDeliveryDate,
    required this.createdAt,
  });

  factory DeliveryHistoryModel.fromJson(Map<String, dynamic> json) {
    List<Facility> facilities = (json['order_items'] as List<dynamic>)
        .map((item) => Facility.fromJson(item['product']['category']['facility']))
        .toList();

    return DeliveryHistoryModel(
      customer: Customer.fromJson(json['customer']),
      facilities: facilities, 
      codeNumber: json['code_number'],
      address: json['address'],
      shippingCost: json['shipping_cost'],
      doneDeliveryDate: DateTime.parse(json['done_delivery_date']),
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}

class Customer {
  final String? firstName;
  final String? lastName;
  final String? fullName;
  final String? phone;

  Customer({
    this.firstName,
    this.lastName,
    this.fullName,
    this.phone,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      firstName: json['first_name'],
      lastName: json['last_name'],
      fullName: json['full_name'],
      phone: json['phone'],
    );
  }
}

class Facility {
  final int id;
  final String image;
  final String fullName;
  final String phone;
  final String address;
  final double latitude;
  final double longitude;

  Facility({
    required this.id,
    required this.image,
    required this.fullName,
    required this.phone,
    required this.address,
    required this.latitude,
    required this.longitude,
  });

  factory Facility.fromJson(Map<String, dynamic> json) {
    return Facility(
      id: json['id'],
      image: json['image'],
      fullName: json['full_name'],
      phone: json['phone'],
      address: json['address'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}