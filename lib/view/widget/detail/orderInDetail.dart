import 'package:flutter/material.dart';
import 'package:taxiapp/view/widget/detail/orderitemlist.dart';

class OrderInDetail extends StatelessWidget {
  const OrderInDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        margin: const EdgeInsets.symmetric(vertical: 10),
        // height: 300,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Text(
                  "الطلب الاول",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                OrderItemList(),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


