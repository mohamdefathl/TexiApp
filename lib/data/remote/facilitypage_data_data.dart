import 'package:taxiapp/core/AppUrl.dart';
import 'package:taxiapp/core/fetchApi.dart';

class OrderPageData {
  FetchApi fetchApi;
  OrderPageData(this.fetchApi);

  getData() async {
    var response = await fetchApi.getData(AppApiUrl.mainOrders);
    // print(response);
    return response.fold((l) => l, (r) => r);
  }
  getDataStatus(id) async {
    var response = await fetchApi.getData(AppApiUrl.checkStatus+id.toString());
    // var response = await fetchApi.getData("http://192.168.0.103:8000/order/get-status/$id");
    // print(response);
    return response.fold((l) => l, (r) => r);
  }
}
