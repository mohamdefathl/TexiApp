class OrderModel {
  final int id;
  final Customer customer;
  final String codeNumber;
  final String totalOrderPrice;
  final String shippingCost;
  final String totalPrice;
  final String purePriceAfterDiscount;
  final double latitude;
  final double longitude;
  final String address;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<OrderItem> orderItems;
  final Map<int, FacilityOrderInfo> groupedOrderItems;

  OrderModel({
    required this.id,
    required this.customer,
    required this.codeNumber,
    required this.totalOrderPrice,
    required this.shippingCost,
    required this.totalPrice,
    required this.purePriceAfterDiscount,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.createdAt,
    required this.updatedAt,
    required this.orderItems,
    required this.groupedOrderItems,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    List<dynamic>? orderItemsJson = json['order_items'];
    List<OrderItem> orderItems = orderItemsJson
        ?.map((item) => OrderItem.fromJson(item))
        .whereType<OrderItem>()
        .toList() ?? [];

    Map<int, FacilityOrderInfo> groupedOrderItems = {};
    for (OrderItem item in orderItems) {
      int? facilityId =
          item.product?.category?.facility?.id; // null-safe operators added
      if (facilityId != null) {
        if (groupedOrderItems.containsKey(facilityId)) {
          groupedOrderItems[facilityId]!.orderItems.add(item);
        } else {
          groupedOrderItems[facilityId] = FacilityOrderInfo(
            id: facilityId,
            fullName: item.product?.category?.facility?.fullName ?? "",
            address: item.product?.category?.facility?.address ?? "",
            phone: item.product?.category?.facility?.phone ?? "",
            image: item.product?.category?.facility?.image ?? "",
            latitude: item.product?.category?.facility?.latitude ?? 0.0,
            longitude: item.product?.category?.facility?.longitude ?? 0.0,
            orderItems: [item],
          );
        }
      }
    }

    return OrderModel(
      id: json['id'] ?? 0, // default value added
      customer: Customer.fromJson(json['customer'] ?? {}), // default value added
      codeNumber: json['code_number'] ?? "",
      totalOrderPrice: json['total_order_price'] ?? "",
      shippingCost: json['shipping_cost'] ?? "",
      totalPrice: json['total_price'] ?? "",
      purePriceAfterDiscount: json['pure_price_after_discount'] ?? "",
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0.0, // null-safe and default value added
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0, // null-safe and default value added
      address: json['address'] ?? "",
      createdAt: DateTime.tryParse(json['created_at'] ?? "") ?? DateTime.now(), // null-safe and default value added
      updatedAt: DateTime.tryParse(json['updated_at'] ?? "") ?? DateTime.now(), // null-safe and default value added
      orderItems: orderItems,
      groupedOrderItems: groupedOrderItems,
    );
  }
}
class FacilityOrderInfo {
  int id;
  String fullName;
  String address;
  String phone;
  String image;
  double latitude;
  double longitude;
  List<OrderItem> orderItems;

  FacilityOrderInfo({
    required this.id,
    required this.fullName,
    required this.address,
    required this.phone,
    required this.orderItems,
    required this.image,
    required this.latitude,
    required this.longitude,
  });
}

class Customer {
  String? firstName;
  String? lastName;
  String? fullName;
  String? phone;

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

class OrderItem {
  int? id;
  Product? product;
  int? quantity;
  String? unitPrice;
  int? order;

  OrderItem({
    this.id,
    this.product,
    this.quantity,
    this.unitPrice,
    this.order,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['id'],
      product: Product.fromJson(json['product']),
      quantity: json['quantity'],
      unitPrice: json['unit_price'],
      order: json['order'],
    );
  }
}

class Product {
  String? name;
  String? image;
  Category? category;

  Product({
    this.name,
    this.image,
    this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      image: json['image'] ?? '',
      category: Category.fromJson(json['category']),
    );
  }
}

class Category {
  String? name;
  Facility? facility;

  Category({
    this.name,
    this.facility,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['name'],
      facility: Facility.fromJson(json['facility']),
    );
  }
}

class Facility {
  int id;
  String image;
  String fullName;
  String phone;
  String address;
  double latitude;
  double longitude;

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
      id: json['id']??"",
      image: json['image']??"",
      fullName: json['full_name']??"",
      phone: json['phone']??"",
      address: json['address']??"",
      latitude: json['latitude']??15.282804196221251,
      longitude: json['longitude']??44.22927981723555,
    );
  }
}
