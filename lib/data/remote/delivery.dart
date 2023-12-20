import 'package:taxiapp/core/AppUrl.dart';
import 'package:taxiapp/core/fetchApi.dart';

class DelivryOrderPageData {
  FetchApi fetchApi;
  DelivryOrderPageData(this.fetchApi);

  getData(token) async {
    var response = await fetchApi.getData(AppApiUrl.mainOrders,token);
    // print(response);
    return response.fold((l) => l, (r) => r);
  }

  getDataStatus(id,token) async {
    var response =
        await fetchApi.getData(AppApiUrl.checkStatus + id.toString(),token);
    // var response = await fetchApi.getData("http://192.168.0.103:8000/order/get-status/$id");
    // print(response);
    return response.fold((l) => l, (r) => r);
  }
}
