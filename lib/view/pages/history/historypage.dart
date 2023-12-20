import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxiapp/constant/color.dart';
import 'package:taxiapp/controllers/delivery_controllers/history_static.dart';
import 'package:taxiapp/controllers/delivery_controllers/histroy_controller.dart';
import 'package:taxiapp/core/handlingdataview.dart';
import 'package:taxiapp/data/models/delivery_history_static_model.dart';
import 'package:taxiapp/data/models/delivryhistory_model.dart';
import 'package:taxiapp/functions/hundlingdata.dart';
import 'package:taxiapp/view/widget/history/appbarHistory.dart';
import 'package:taxiapp/view/widget/history/cardStaticWidget.dart';
import 'package:taxiapp/view/widget/history/deliverdOrdersCard.dart';
import 'package:taxiapp/view/widget/history/pirsonalInformationWidget.dart';
import 'package:taxiapp/view/widget/history/titleAligbHistoryPage.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme themeText = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          HistoryPageAppBar(themeText: themeText),
          const TitleAlignHistoryPage(
            title: "المعلومات الشخصية",
          ),
          PersonalInformationWidget(),
          const TitleAlignHistoryPage(
            title: "إحصائيات الحساب",
          ),

          GetBuilder<HistoryControllerStatic>(
            init: HistoryControllerStatic(),
            builder: (_) {
              return HandlingDataView(
                statusRequest: _.statusRequest,
                widget: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      final deliveryOrdersStatics =
                          DeliveryOrdersStatics.fromJson(_.data[index]);

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CardStaticsHistoryPage(
                            themeText: themeText,
                            value: double.parse(deliveryOrdersStatics.day.toString()),
                            icon: Icons.credit_card,
                            title: 'صافي اليوم',
                          ),
                          
                          CardStaticsHistoryPage(
                            themeText: themeText,
                            value: deliveryOrdersStatics.mounth,
                            icon: Icons.wallet,
                            title: "صافي الشهر",
                          ),
                          CardStaticsHistoryPage(
                            themeText: themeText,
                            value: deliveryOrdersStatics.year,
                            icon: Icons.attach_money_sharp,
                            title: "صافي السنه",
                          ),
                        ],
                      );
                    },
                    childCount: _.data.length,
                  ),
                ),
              );
            },
          ),
          const TitleAlignHistoryPage(
            title: "طلبات تم ايصالها",
          ),
          GetBuilder<HistoryController>(
            init: HistoryController(),
            builder: (controller) {
              return HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      final deliveryHistory =
                          DeliveryHistoryModel.fromJson(controller.data[index]);

                      return Column(
                        children: [
                          DeliverdOrders(
                              colorScheme: colorScheme,
                              themeText: themeText,
                              deliveryHistoryModel: deliveryHistory),
                        ],
                      );
                    },
                    childCount: controller.data.length,
                  ),
                ),
              );
            },
          )
          // SliverToBoxAdapter(
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       PersonalInformationWidget(),

          //       DeliverdOrders(themeText: themeText),
          //       DeliverdOrders(themeText: themeText),
          //       SizedBox(
          //         height: MediaQuery.of(context).size.height * 0.02,
          //       )
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
