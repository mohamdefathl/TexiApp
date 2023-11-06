import 'package:flutter/material.dart';
import 'package:taxiapp/constant/color.dart';
import 'package:taxiapp/view/pages/detail/detailpage.dart';
import 'package:taxiapp/view/pages/login/login.dart';
import 'package:taxiapp/view/widget/elevatedButton.dart';
import 'package:taxiapp/view/widget/home/ordersfromto.dart';
import 'package:taxiapp/view/widget/simpleLine.dart';

class Order extends StatelessWidget {
  const Order(
      {super.key,
      required this.sourceLocation,
      required this.destinationLocation});
  final String sourceLocation;
  final String destinationLocation;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // decoration: BoxDecoration(color: Colors.red.shade500),
        margin: EdgeInsets.symmetric(vertical: 7),
        width: MediaQuery.of(context).size.width * 0.9,
        child: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "الطلبات في الفاتورة",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Center(
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: const SimpleLine()),
                ),
                OrderRowFromTo(title: "من", location: sourceLocation),
                const SimpleLine(),
                OrderRowFromTo(title: "الى", location: destinationLocation),
                const SizedBox(
                  height: 10,
                ),
                CustomElevatedButton(
                    title: "المزيد من التفاصيل",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailPage()));
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
