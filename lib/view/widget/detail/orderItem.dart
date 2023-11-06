import 'package:flutter/material.dart';
import 'package:taxiapp/constant/color.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.value, required this.title});
  final String value;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
            child: Text(
          value,
          textAlign: TextAlign.end,
        )),
        Text(
          " : $title  ",
          style: const TextStyle(color: AppColor.primary),
        ),
      ],
    );
  }
}
