import 'package:taxiapp/core/AppUrl.dart';
import 'package:taxiapp/core/fetchApi.dart';

class HistoryPageData {
  FetchApi fetchApi;
  HistoryPageData(this.fetchApi);

  getData(token) async {
    var response = await fetchApi.getData(AppApiUrl.deliveryHistory, token);

    return response.fold((l) => l, (r) => r);
  }
  getDataStatics(token) async {
    var response = await fetchApi.getData(AppApiUrl.deliveryHistoryStatic, token);

    return response.fold((l) => l, (r) => r);
  }
}
