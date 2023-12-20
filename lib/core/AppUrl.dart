class AppApiUrl {
  // static const String server = "http://192.168.1.107:8000/";
  static const String server = "http://192.168.0.103:8000/";
  
  static const String auth = "${server}customer/login/";
  static const String mainOrders = "${server}delivery/orders/";
  static const String checkStatus = "${server}order/get-status/";
  static const String changeOrderState = "${server}delivery/delviery-order-update/";
  static const String taxiOrders = "${server}order/driver-taxi-orders/";
  static const String onGoaing = "${server}delivery/his-in-way-orders/";
  static const String deliveryHistory = "${server}delivery/completed-orders/";
  static const String deliveryHistoryStatic = "${server}delivery/orders-summary/";
  static const String taxiUpdateOrderState = "${server}taxi/update-order/";


}
