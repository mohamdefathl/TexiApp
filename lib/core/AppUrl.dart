class AppApiUrl {
  static const String server = "http://192.168.0.103:8000/";
  // static const String server = "http://192.168.130.133:8000/";
  static const String auth = "${server}customer/login/";
  static const String mainOrders = "${server}delivery/orders/";
  static const String checkStatus = "${server}order/get-status/";
  static const String changeOrderState = "${server}delivery/delviery-order-update/";
}
