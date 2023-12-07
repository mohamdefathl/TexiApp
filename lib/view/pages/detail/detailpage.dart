import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:taxiapp/constant/color.dart';
import 'package:taxiapp/controllers/detailpage_controller.dart';
import 'package:taxiapp/controllers/map_controller.dart';
import 'package:taxiapp/data/models/orders_model.dart';
import 'package:taxiapp/view/widget/detail/priceTitle.dart';
import 'package:taxiapp/view/widget/detail/titlewithicon.dart';
import 'package:taxiapp/view/widget/detail/userTitle.dart';
import 'package:taxiapp/view/widget/general/cardIconButton.dart';
import 'package:taxiapp/view/widget/general/cardMassageCall.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key? key, required this.orderModel}) : super(key: key);
  final OrderModel orderModel;
  final CustomMapController mapController = Get.put(CustomMapController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: GetBuilder<DetailPageController>(
      //     init: DetailPageController(),

      //     builder: (_) {
      //       return ElevatedButton(
      //           onPressed: () {
      //             Get.defaultDialog(
      //                 middleText: "هل ترغب في المواصلة في اخذ الطلب",
      //                 onCancel: () {
      //                   Get.back();
      //                 },
      //                 cancel: ElevatedButton(
      //                     onPressed: () {
      //                       Get.back();
      //                     },
      //                     child: Text(
      //                       "الغاء",
      //                       style: Theme.of(context)
      //                           .textTheme
      //                           .titleSmall!
      //                           .copyWith(color: Colors.white),
      //                     )),
      //                 confirm: ElevatedButton(
      //                     onPressed: () {
      //                       _.updateDeliveryOrder(3,'');
      //                     },
      //                     child: Text(
      //                       "متابعة",
      //                       style: Theme.of(context)
      //                           .textTheme
      //                           .titleSmall!
      //                           .copyWith(color: Colors.white),
      //                     )),
      //                 onConfirm: () {
      //                   Get.back();
      //                 },
      //                 title: "اخذ الطلب",
      //                 titleStyle: Theme.of(context).textTheme.titleSmall!);
      //           },
      //           child: Text(
      //             "أخذ الطلب",
      //             style: Theme.of(context)
      //                 .textTheme
      //                 .titleSmall!
      //                 .copyWith(color: Colors.white),
      //           ));
      //     }),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: MediaQuery.of(context).size.height * 0.1,
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CardIconButtonAppBar(
                  icon: Icons.map,
                  onCLick: () {
                    Get.toNamed("/map");
                  },
                ),
                Text(
                  "تفاصيل الطلب",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                CardIconButtonAppBar(
                  icon: Icons.arrow_forward_ios_outlined,
                  onCLick: () {
                    Get.back();
                  },
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: orderModel.groupedOrderItems?.length ?? 0,
                        itemBuilder: (context, index) {
                          int facilityId = orderModel.groupedOrderItems!.keys
                              .elementAt(index);
                          FacilityOrderInfo facilityOrderInfo =
                              orderModel.groupedOrderItems![facilityId]!;

                          mapController.addFacilityCoordinates(
                              orderModel, facilityOrderInfo);

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            facilityOrderInfo.latitude
                                                .toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                          ),
                                          Text(
                                            facilityOrderInfo.longitude
                                                .toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                          ),
                                          Text(
                                            ' ${facilityOrderInfo.fullName}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                          ),
                                          Text(
                                            ' ${facilityOrderInfo.address}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                    color: Colors.grey,
                                                    fontSize: 12),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 13,
                                      ),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          facilityOrderInfo.image,
                                          width: 70,
                                          height: 70,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "# ${orderModel.codeNumber}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall,
                                            ),
                                            Text(
                                              "رمز الطلب ",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall,
                                            ),
                                          ],
                                        ),
                                        Text(
                                          ' ${facilityOrderInfo.phone}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: facilityOrderInfo.orderItems
                                    .map((orderItem) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        ' ${orderItem.product!.name}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                      Text(
                                        ' الكمية : ${orderItem.quantity} ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                    ],
                                  );
                                }).toList(),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  const TitleWithIconDetailPage(
                    title: 'معلومات الدفع',
                    image: 'assets/images/payment2.png',
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: Column(
                        children: [
                          PriceTitleDetailPage(
                            price: orderModel.totalOrderPrice!,
                            title: 'مجموع سعر الطلب',
                          ),
                          PriceTitleDetailPage(
                            price: orderModel.shippingCost!,
                            title: 'سعر التوصيل',
                          ),
                          PriceTitleDetailPage(
                            price: orderModel.totalPrice!,
                            title: 'السعر الكلي',
                          ),
                          const Divider(),
                          PriceTitleDetailPage(
                            price: orderModel.purePriceAfterDiscount!,
                            title: 'السعر الصافي بعد الخصم',
                          ),
                        ],
                      ),
                    ),
                  ),
                  const TitleWithIconDetailPage(
                    title: 'معلومات الزبون',
                    image: 'assets/images/customer.png',
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: Column(
                        children: [
                          UserTitleDetailPage(
                              icon: Icons.person,
                              title: 'رقم الهاتف',
                              value: orderModel.customer!.fullName!),
                          UserTitleDetailPage(
                              icon: Icons.location_on_outlined,
                              title: 'الموقع',
                              value: orderModel.address!),
                          UserTitleDetailPage(
                              icon: Icons.call,
                              title: 'رقم الهاتف',
                              value: orderModel.customer!.phone!),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                CardMassageCall(
                                  icon: Icons.call,
                                  iconColor: Colors.greenAccent,
                                  service: 'tel',
                                  phoneNumber: orderModel.customer!.phone!,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                CardMassageCall(
                                  icon: Icons.message,
                                  iconColor: Colors.blue,
                                  service: 'sms',
                                  phoneNumber: orderModel.customer!.phone!,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Builder(
                    builder: (context) {
                      final GlobalKey<SlideActionState> _key = GlobalKey();
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SlideAction(
                          reversed: true,
                          text: "أخذ الطلب",
                          // height: 70,
                          sliderRotate: false,
                          textStyle: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: AppColor.primary),
                          outerColor: Color(0xFFC0E2FF),
                          innerColor: AppColor.primary,
                          // sliderButtonIconSize:30,
                          // child: Text("أخذ الطلب"),
                          key: _key,

                          onSubmit: () async {
                            print("object");
                            // Future.delayed(
                            //   Duration(seconds: 1),
                            //   () => _key.currentState!.reset(),
                            // );
                          },
                        ),
                      );
                    },
                  ),
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
