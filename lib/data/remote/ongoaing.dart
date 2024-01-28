import 'package:taxiapp/core/AppUrl.dart';
import 'package:taxiapp/core/fetchApi.dart';

class OnGoaingPageData {
  FetchApi fetchApi;
  OnGoaingPageData(this.fetchApi);

  getData(token) async {
    var response = await fetchApi.getData(AppApiUrl.onGoaing,token);    
    return response.fold((l) => l, (r) => r);
  }
}
