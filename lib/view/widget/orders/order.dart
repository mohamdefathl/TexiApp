import 'package:flutter/material.dart';
import 'package:taxiapp/constant/color.dart';
import 'package:taxiapp/data/models/orders_model.dart';
import 'package:taxiapp/functions/getElapsedTime.dart';
import 'package:taxiapp/view/widget/general/CardMessageRow.dart';

class Order extends StatelessWidget {
  const Order(
      {super.key,
      required this.orderModel,
      required this.onTap,
      required this.len});
  final OrderModel orderModel;
  final VoidCallback onTap;
  final int? len;

  @override
  Widget build(BuildContext context) {
    TextTheme themeText = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.02),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Stack(
              children: [
                Positioned(
                    bottom: 0,
                    left: 0,
                    child: Text(
                      "منذ ${getElapsedTime(orderModel.createdAt!)}",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.grey, fontSize: 10),
                    )),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Text(
                    "القسم : ${orderModel.orderItems![0].product!.category!.name!}",
                    style: themeText.titleSmall!
                        .copyWith(color: Colors.grey, fontSize: 10),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text(
                      "الطلب #${orderModel.codeNumber}",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: colorScheme.primary,
                          ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.07),
                      child: const Divider(
                        
                        thickness: 1,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        len! > 1
                            ? Text(
                                "منشأت أخرى +",
                                textAlign: TextAlign.start,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        color: Colors.grey,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                              )
                            : const SizedBox.shrink(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "معلومات المنشأة",
                              style: themeText.titleSmall!.copyWith(
                                  color: colorScheme.primary, fontSize: 14),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),
                            Image.asset(
                              "assets/images/facility.png",
                              width: 27,
                              height: 27,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.04,
                      ),
                      child: Row(
                        children: [
                          CardMessageRow(
                              phoneNumber: orderModel.orderItems![0].product!
                                  .category!.facility!.phone),
                          const Spacer(),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    orderModel.orderItems![0].product!.category!
                                        .facility!.fullName,
                                    style: themeText.titleSmall!
                                        .copyWith(color: colorScheme.primary),
                                  ),
                                  Text(
                                    orderModel.orderItems![0].product!.category!
                                        .facility!.phone,
                                    style: themeText.titleSmall!.copyWith(
                                        color: const Color(0xFF4CBA87), fontSize: 11),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.03,
                              ),
                              Image.network(
                                orderModel.orderItems![0].product!.category!
                                    .facility!.image,
                                width: 27,
                                height: 27,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    OrderSourceDestenation(
                      fromTo: " : المصدر",
                      street: orderModel
                          .orderItems![0].product!.category!.facility!.address,
                      icon: Icons.location_on_outlined,
                      haveIcon: true,
                    ),
                    OrderSourceDestenation(
                      fromTo: " : الوجهة",
                      street: orderModel.address!,
                      icon: Icons.location_on_outlined,
                      haveIcon: true,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextWithSimpleIcon extends StatelessWidget {
  const TextWithSimpleIcon({
    super.key,
    required this.facuiltyPhone,
  });
  final String facuiltyPhone;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          facuiltyPhone,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: Colors.grey, fontSize: 12.5),
        ),
        const Icon(
          Icons.location_on_outlined,
          color: Colors.grey,
          size: 16,
        )
      ],
    );
  }
}

class OrderSourceDestenation extends StatelessWidget {
  const OrderSourceDestenation({
    super.key,
    required this.street,
    required this.fromTo,
    required this.icon,
    required this.haveIcon,
  });
  final String street;
  final String fromTo;
  final IconData icon;
  final bool haveIcon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: Text(
            street,
            style: Theme.of(context).textTheme.titleSmall,
            textAlign: TextAlign.end,
          ),
        ),
        Text(
          fromTo,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: Theme.of(context).colorScheme.primary),
        ),
        haveIcon
            ? Icon(
                icon,
                color:Theme.of(context).colorScheme.primary,
              )
            : const SizedBox.shrink()
      ],
    );
  }
}
