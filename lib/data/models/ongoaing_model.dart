

class OnGoaingOrderModel {
  int? id;
  Customer? customer;
  String? codeNumber;
  String? totalOrderPrice;
  String? shippingCost;
  String? totalPrice;
  String? purePriceAfterDiscount;
  double? latitude;
  double? longitude;
  String? address;
  DateTime? createdAt;
  DateTime? updatedAt;
  int ?delivery;
  List<OrderItem>? orderItems;
  Map<int, FacilityOnGoaingOrderInfo>? groupedOrderItems;

  OnGoaingOrderModel({
    this.id,
    this.customer,
    this.codeNumber,
    this.totalOrderPrice,
    this.shippingCost,
    this.totalPrice,
    this.purePriceAfterDiscount,
    this.latitude,
    this.longitude,
    this.address,
    this.createdAt,
    this.updatedAt,
    this.orderItems,
    this.groupedOrderItems,
    this.delivery
  });

  factory OnGoaingOrderModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> orderItemsJson = json['order_items'];
    List<OrderItem> orderItems =
        orderItemsJson.map((item) => OrderItem.fromJson(item)).toList();

    Map<int, FacilityOnGoaingOrderInfo> groupedOrderItems = {};
    for (OrderItem item in orderItems) {
      int facilityId = item.product!.category!.facility!.id;
      if (groupedOrderItems.containsKey(facilityId)) {
        groupedOrderItems[facilityId]!.orderItems.add(item);
      } else {
        groupedOrderItems[facilityId] = FacilityOnGoaingOrderInfo(
          id: facilityId,
          fullName: item.product!.category!.facility!.fullName,
          address: item.product!.category!.facility!.address,
          phone: item.product!.category!.facility!.phone,
          image: item.product!.category!.facility!.image,
          latitude:  item.product!.category!.facility!.latitude,
          longitude:  item.product!.category!.facility!.longitude,
          orderItems: [item],
        );
      }
    }

    return OnGoaingOrderModel(
      id: json['id'],
      customer: Customer.fromJson(json['customer']),
      codeNumber: json['code_number'],
      totalOrderPrice: json['total_order_price'],
      shippingCost: json['shipping_cost'],
      totalPrice: json['total_price'],
      purePriceAfterDiscount: json['pure_price_after_discount'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      address: json['address'],
      delivery: json['delivery'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      orderItems: orderItems,
      groupedOrderItems: groupedOrderItems,
    );
  }
}

class FacilityOnGoaingOrderInfo {
  int id;
  String fullName;
  String address;
  String phone;
  String image;
  double latitude;
  double longitude;
  List<OrderItem> orderItems;

  FacilityOnGoaingOrderInfo({
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
      image: json['image'],
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
