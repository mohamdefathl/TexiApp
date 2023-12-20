import 'package:flutter/material.dart';
import 'package:taxiapp/data/models/orders_model.dart';
import 'package:taxiapp/view/widget/detail/priceTitle.dart';
import 'package:taxiapp/view/widget/detail/titlewithicon.dart';

class DetailPagePaymentInfo extends StatelessWidget {
  const DetailPagePaymentInfo({
    super.key,
    required this.orderModel,
  });

  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleWithIconDetailPage(
          title: 'معلومات الدفع',
          image: 'assets/images/payment2.png',
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              children: [
                PriceTitleDetailPage(
                  price: orderModel.totalOrderPrice!,
                  title: 'مجموع سعر الطلب',
                  isFinal: false,
                ),
                PriceTitleDetailPage(
                  price: orderModel.shippingCost!,
                  title: 'سعر التوصيل',
                  isFinal: false,
                ),
                PriceTitleDetailPage(
                  price: orderModel.totalPrice!,
                  title: 'السعر الكلي',
                  isFinal: false,
                ),
                 Divider(
                  color: Theme.of(context).colorScheme.primary,
                ),
                PriceTitleDetailPage(
                  price: orderModel.purePriceAfterDiscount!,
                  title: 'السعر الصافي بعد الخصم',
                  isFinal: true,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}