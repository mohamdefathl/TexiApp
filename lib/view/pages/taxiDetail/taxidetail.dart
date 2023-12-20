import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:slide_to_act/slide_to_act.dart';

import 'package:taxiapp/controllers/taxi_controllers/taxihome_controller.dart';
import 'package:taxiapp/controllers/taxi_controllers/taxiorders_controller.dart';
import 'package:taxiapp/data/models/taxi_orders_model.dart';
import 'package:taxiapp/functions/getElapsedTime.dart';
import 'package:taxiapp/view/pages/taxihome/taxihome.dart';
import 'package:taxiapp/view/widget/detail/titlewithicon.dart';
import 'package:taxiapp/view/widget/detail/userTitle.dart';
import 'package:taxiapp/view/widget/general/CardMessageRow.dart';
import 'package:taxiapp/view/widget/general/cardIconButton.dart';
import 'package:intl/intl.dart';

class TaxiDetailPage extends StatelessWidget {
  TaxiDetailPage({Key? key, required this.taxiOrderModel}) : super(key: key);

  final TaxiOrderModel taxiOrderModel;
  // HomeController homeController = Get.put(HomeController());
  TaxiHomeController taxiHomeController = Get.put(TaxiHomeController());

  @override
  Widget build(BuildContext context) {
    TextTheme themeText = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    String time =
        DateFormat('a h:mm  y/M/d', 'ar').format(taxiOrderModel.pickupTime);

    DateTime now = DateTime.now();
    DateTime pickupTime = taxiOrderModel.pickupTime;

    Duration difference = pickupTime.difference(now);

    String status;
    if (difference.isNegative) {
      // The pickup time is in the past
      status = 'مضى ${formatDuration(-difference, context)}';
    } else {
      // The pickup time is in the future
      status = 'تبقى ${formatDuration(difference, context)}';
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        automaticallyImplyLeading: false,
        title: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                "تفاصيل الطلب",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: CardIconButtonAppBar(
                icon: Icons.arrow_forward_ios_outlined,
                onCLick: () {
                  Get.back();
                },
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: CardIconButtonAppBar(
                icon: Icons.map,
                onCLick: () {
                  
                  Get.back();
                },
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TitleWithIconDetailPage(
              title: 'معلومات الطلب',
              image: 'assets/images/order.png',
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.97,
              child: Card(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "منذ ${getElapsedTime(taxiOrderModel.createdAt)}",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: Colors.grey, fontSize: 10),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.05,
                        vertical: MediaQuery.of(context).size.height * 0.01,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025,
                          ),
                          Text(
                            "#الطلب ${taxiOrderModel.orderNumber}",
                            textAlign: TextAlign.center,
                            style: themeText.titleMedium!.copyWith(
                              color: colorScheme.primary,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height * 0.01),
                            child: const Divider(
                              thickness: 1,
                            ),
                          ),
                          TaxiDetailPageLocation(
                              location: taxiOrderModel.pickupLocation,
                              title: ":موقع الالتقاط ",
                              themeText: themeText),
                          TaxiDetailPageLocation(
                              location: taxiOrderModel.destination,
                              title: ":الوجهة ",
                              themeText: themeText),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.015,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                time,
                                style: themeText.titleSmall,
                              ),
                              Text(
                                "موعد الالتقاط",
                                style: themeText.titleSmall,
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          taxiOrderModel.customerNotes.isNotEmpty
                              ? Align(
                                  alignment: Alignment.centerRight,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "ملاحظات الزبون",
                                        style: themeText.titleSmall,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.02,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              taxiOrderModel.customerNotes,
                                              style: themeText.titleSmall,
                                            ),
                                            Text(
                                              " * ",
                                              style: themeText.titleMedium!
                                                  .copyWith(
                                                      color: Colors.redAccent,
                                                      fontWeight:
                                                          FontWeight.w900),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : const SizedBox.shrink(),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: MediaQuery.of(context).size.height *
                                      0.01),
                              decoration: BoxDecoration(
                                color: colorScheme.onInverseSurface,
                                // color: Color(0xFF10403E),

                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              child: Text(
                                'تكلفة التوصيل ريال ${taxiOrderModel.fareAmount}',
                                style: themeText.titleSmall!.copyWith(
                                    color: Color(0xFF4CBA87), fontSize: 11),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              status,
                              style: themeText.titleSmall!
                                  .copyWith(color: Colors.grey, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const TitleWithIconDetailPage(
              title: 'معلومات الزبون',
              image: 'assets/images/customer.png',
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.97,
              child: Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                    vertical: MediaQuery.of(context).size.height * 0.01,
                  ),
                  child: Column(
                    children: [
                      UserTitleDetailPage(
                          icon: Icons.person,
                          title: 'اسم الزبون',
                          value: taxiOrderModel.customer.fullName),
                      UserTitleDetailPage(
                          icon: Icons.call,
                          title: 'رقم الهاتف',
                          value: taxiOrderModel.customer.phone),
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: CardMessageRow(
                              phoneNumber: taxiOrderModel.customer.phone)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Builder(
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GetBuilder<TaxiOrdersController>(
                    builder: (_) {
                      return SlideAction(
                        reversed: true,
                        text: "أخذ الطلب",
                        height: 60,
                        sliderRotate: false,
                        sliderButtonIconSize: 20,
                        textStyle: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: Theme.of(context).colorScheme.tertiary),
                        outerColor: Theme.of(context).colorScheme.outline,
                        innerColor: Theme.of(context).colorScheme.tertiary,
                        onSubmit: () async {
                          await _.updateTaxiOrderState(taxiOrderModel.id);
                          Get.offAll(() => TaxiHome(),
                              transition: Transition.fadeIn);
                          taxiHomeController.onItemTapped(2);
                        },
                      );
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class TaxiDetailPageLocation extends StatelessWidget {
  const TaxiDetailPageLocation({
    super.key,
    required this.themeText,
    required this.title,
    required this.location,
  });

  final String title;
  final String location;
  final TextTheme themeText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.location_on,
              size: 20,
              color: Color(0xFF2F587B),
            ),
            Text(
              location,
              style: themeText.titleSmall!.copyWith(
                  color: Color(0xFF2F587B),
                  fontWeight: FontWeight.w900,
                  fontSize: 13),
            ),
          ],
        ),
        Text(
          title,
          style:
              themeText.titleSmall!.copyWith(color: Colors.grey, fontSize: 13),
        ),
      ],
    );
  }
}

String formatDuration(Duration duration, BuildContext context) {
  var arabicFormat = NumberFormat.decimalPattern('ar');

  List<String> parts = [];

  if (duration.inDays > 0) {
    parts.add('${arabicFormat.format(duration.inDays)} يوم');
    duration -= Duration(days: duration.inDays);
  }

  if (duration.inHours > 0) {
    parts.add('${arabicFormat.format(duration.inHours)} ساعة');
    duration -= Duration(hours: duration.inHours);
  }

  if (duration.inMinutes > 0) {
    parts.add('${arabicFormat.format(duration.inMinutes)} دقيقة');
    duration -= Duration(minutes: duration.inMinutes);
  }

  return parts.join(' ');
}
