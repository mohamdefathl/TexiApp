import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxiapp/constant/color.dart';
import 'package:taxiapp/data/models/orders_model.dart';
import 'package:taxiapp/functions/getElapsedTime.dart';
import 'package:taxiapp/view/widget/DeliveryWidgets/detail/mainSecions/customerSection.dart';
import 'package:taxiapp/view/widget/DeliveryWidgets/detail/mainSecions/paymentSection.dart';
import 'package:taxiapp/view/widget/DeliveryWidgets/detail/takeOrderButton.dart';
import 'package:taxiapp/view/widget/DeliveryWidgets/detail/titlewithicon.dart';
import 'package:taxiapp/view/widget/general/CardMessageRow.dart';
import 'package:taxiapp/view/widget/general/cardIconButton.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.orderModel}) : super(key: key);
  final OrderModel orderModel;
  // final CustomMapController mapController = Get.put(CustomMapController());

  @override
  Widget build(BuildContext context) {
    TextTheme themeText = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
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
              ],
            ),
            pinned: false,
            snap: true,
            floating: true,
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.02),
              child: Column(
                children: [
                  const TitleWithIconDetailPage(
                    title: 'معلومات الطلب',
                    image: 'assets/images/order.png',
                  ),
                  Card(
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "منذ ${getElapsedTime(orderModel.createdAt!)}",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: Colors.grey, fontSize: 10),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Text(
                              "الطلب #${orderModel.codeNumber}",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: colorScheme.primary,
                                  ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 0),
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  orderModel.groupedOrderItems?.length ?? 0,
                              itemBuilder: (context, index) {
                                int facilityId = orderModel
                                    .groupedOrderItems!.keys
                                    .elementAt(index);
                                FacilityOrderInfo facilityOrderInfo =
                                    orderModel.groupedOrderItems![facilityId]!;

                                // mapController.addFacilityCoordinates(
                                //     orderModel, facilityOrderInfo);
                                // print(mapController.facilityCoordinates);
                                // print(mapController.facilityCoordinates.length);

                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01),
                                      child: Divider(
                                        thickness: 1,
                                        color: colorScheme.primary,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        CardMessageRow(
                                            phoneNumber:
                                                facilityOrderInfo.phone),
                                        const Spacer(),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(facilityOrderInfo.fullName,
                                                style: themeText.titleSmall),
                                            Row(
                                              children: [
                                                Text(
                                                  facilityOrderInfo.phone,
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: themeText.titleSmall!
                                                      .copyWith(
                                                          color: Colors.green),
                                                ),
                                                const Icon(
                                                  Icons.call,
                                                  color: Colors.green,
                                                  size: 15,
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.02,
                                        ),
                                        Image.network(
                                          facilityOrderInfo.image,
                                          width: 60,
                                          height: 60,
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            facilityOrderInfo.address,
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style: themeText.titleSmall!
                                                .copyWith(color: Colors.grey),
                                          ),
                                          const Icon(
                                            Icons.location_on,
                                            color: Colors.grey,
                                            size: 20,
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "المنتجات",
                                            style: themeText.titleSmall!
                                                .copyWith(
                                                    decoration: TextDecoration
                                                        .underline,
                                                    color: colorScheme.primary,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w900),
                                          ),
                                          Text(
                                            "*",
                                            style: themeText.titleMedium!
                                                .copyWith(
                                                    color: colorScheme.primary),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: facilityOrderInfo.orderItems
                                          .map((orderItem) {
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.017,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.02),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal:
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.02,
                                                        vertical: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.01),
                                                    decoration: BoxDecoration(
                                                        color: colorScheme
                                                            .inversePrimary,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30)),
                                                    child: Text(
                                                      ' الكمية : ${orderItem.quantity} ',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleSmall!
                                                          .copyWith(
                                                              color: colorScheme
                                                                  .primary),
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Text(
                                                    ' ${orderItem.product!.name}',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleSmall,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      }).toList(),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  DetailPagePaymentInfo(orderModel: orderModel),
                  DetailCustomerInfo(orderModel: orderModel),
                  const SizedBox(
                    height: 10,
                  ),
                  DetailPageTakeOrderButton(orderModel: orderModel),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ]))
        ],
      ),
    );
  }
}
