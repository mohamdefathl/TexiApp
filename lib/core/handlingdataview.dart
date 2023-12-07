import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taxiapp/core/stateRequset.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    if (statusRequest == StatusRequest.loading) {
      return SliverToBoxAdapter(
          child: Center(
              child: Lottie.asset("assets/images/loading.json", width: 200)));
    } else {
      return statusRequest == StatusRequest.offlinefailure
          ? SliverToBoxAdapter(
              child: Center(
                  child:
                      Lottie.asset("assets/images/offline.json", width: 200)),
            )
          : statusRequest == StatusRequest.serverfailure
              ? const SliverToBoxAdapter(
                child:  Center(
                    child:
                        //  Lottie.asset(AppImageAgit remote add origin https://github.com/username/repository.gitsset.nodata, width: 200)
                        Text("Server Failure")),
              )
              : statusRequest == StatusRequest.noData
                  ? SliverToBoxAdapter(
                    child: Center(
                        child:
                            Lottie.asset("assets/images/noData.json", width: 200)),
                  )
                  : widget;
    }
  }
}
