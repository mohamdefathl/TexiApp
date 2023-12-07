import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taxiapp/constant/color.dart';
import 'package:taxiapp/data/models/orders_model.dart';
import 'package:taxiapp/functions/getElapsedTime.dart';


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
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),        
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width *0.02),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 2,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    len! > 1
                        ? Expanded(
                          child: Text(
                              "+ أخرى",
                              // "${orderModel.groupedProductsLength}",
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      color: Colors.grey,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                            ),
                        )
                        :const SizedBox.shrink(),
                    // const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          orderModel.orderItems![0].product!.category!
                              .facility!.fullName!,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        TextWithSimpleIcon(
                          facuiltyPhone: orderModel.orderItems![0].product!
                              .category!.facility!.phone!,
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        orderModel.orderItems![0].product!.category!
                            .facility!.image!,
                        width: 70,
                        height: 70,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          "(${DateFormat('yyyy-MM-dd HH:mm').format(orderModel.createdAt!)})",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: Colors.grey),
                        ),
                        Text(
                          "منذ ${getElapsedTime(orderModel.createdAt!)}",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                    Text("الطلب #${orderModel.codeNumber}",
                        style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                OrderSourceDestenation(
                  fromTo: " : المصدر",
                  street: orderModel
                      .orderItems![0].product!.category!.facility!.address!,
                  icon: Icons.location_on_outlined,
                  haveIcon: true,
                ),
                OrderSourceDestenation(
                  fromTo: " : الوجهة",
                  street: orderModel.address!,
                  icon: Icons.location_on_outlined,
                  haveIcon: true,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CostTypeWithPrice(
                          title: "التكلفة الكليه",
                          price: "${orderModel.totalPrice} ريال"),
                      CostTypeWithPrice(
                          title: "تكلفة النقل",
                          price: "${orderModel.shippingCost} ريال"),
                      CostTypeWithPrice(
                          title: "تكلفة الطلب",
                          price: "${orderModel.totalOrderPrice} ريال"),
                    ],
                  ),
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

class CostTypeWithPrice extends StatelessWidget {
  const CostTypeWithPrice({
    super.key,
    required this.title,
    required this.price,
  });
  final String title;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Text(
          price,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: Colors.grey),
        ),
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
              .copyWith(color: AppColor.primary),
        ),
        haveIcon
            ? Icon(
                icon,
                color: AppColor.primary,
              )
            : const SizedBox.shrink()
      ],
    );
  }
}




