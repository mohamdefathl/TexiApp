class TaxiOrderModel {
  final int id;
  final Taxi taxi;
  final Customer customer;
  final String orderNumber;
  final String pickupLocation;
  final String destination;
  final DateTime pickupTime;
  final String estimatedDuration;
  final String fareAmount;
  final String status;
  final String customerNotes;
  final String taxiNotes;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic deletedAt;

  TaxiOrderModel({
    required this.id,
    required this.taxi,
    required this.customer,
    required this.orderNumber,
    required this.pickupLocation,
    required this.destination,
    required this.pickupTime,
    required this.estimatedDuration,
    required this.fareAmount,
    required this.status,
    required this.customerNotes,
    required this.taxiNotes,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory TaxiOrderModel.fromJson(Map<String, dynamic> json) {
    return TaxiOrderModel(
      id: json['id'],
      taxi: Taxi.fromJson(json['taxi']),
      customer: Customer.fromJson(json['customer']),
      orderNumber: json['order_number'],
      pickupLocation: json['pickup_location'],
      destination: json['destination'],
      pickupTime: DateTime.parse(json['pickup_time']),
      estimatedDuration: json['estimated_duration'],
      fareAmount: json['fare_amount'],
      status: json['status'],
      customerNotes: json['customer_notes'],
      taxiNotes: json['taxi_notes'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: json['deleted_at'],
    );
  }
}

class Taxi {
  final int id;
  final String email;
  final String phone;
  final String address;
  final double latitude;
  final double longitude;
  final String fullName;

  Taxi({
    required this.id,
    required this.email,
    required this.phone,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.fullName,
  });

  factory Taxi.fromJson(Map<String, dynamic> json) {
    return Taxi(
      id: json['id'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      latitude: double.parse(json['latitude']),
      longitude: double.parse(json['longitude']),
      fullName: json['full_name'],
    );
  }
}


class Customer {
  final String fullName;
  
  final String phone;

  Customer({
    required this.fullName,
    
    required this.phone,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      fullName: json['full_name'],

      phone: json['phone'],
    );
  }
}
