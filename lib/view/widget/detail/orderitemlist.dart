import 'package:flutter/material.dart';
import 'package:taxiapp/view/widget/detail/orderItem.dart';
import 'package:taxiapp/view/widget/simpleLine.dart';

class OrderItemList extends StatelessWidget {
  const OrderItemList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OrderItem(
            title: "الطلب",
            value:
                "برغر بالجبن بالجبن بالجبن بالجبن بالجبن بالجبن بالجبن بالجبن بالجبن بالجبن والطعميه"),
        SimpleLine(),
        OrderItem(title: "المصدر", value: "برغر بالجبن والطعميه"),
        SimpleLine(),
        OrderItem(title: "الوجهة", value: "برغر بالجبن والطعميه"),
        SimpleLine(),
        OrderItem(title: "المنشأة", value: "برغر بالجبن والطعميه"),
        SimpleLine(),
        OrderItem(
            title: "اسم الزبون", value: "برغر بالجبن والطعميه"),
      ],
    );
  }
}