import 'package:taxiapp/core/AppUrl.dart';
import 'package:taxiapp/core/fetchApi.dart';

class TaxiOrderPageData {
  FetchApi fetchApi;
  TaxiOrderPageData(this.fetchApi);

  getData(token) async {
    var response = await fetchApi.getData(AppApiUrl.taxiOrders,token);
    // print(response);
    return response.fold((l) => l, (r) => r);
  }  
}
