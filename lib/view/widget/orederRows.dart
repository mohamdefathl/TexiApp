import 'package:flutter/material.dart';
import 'package:taxiapp/constant/color.dart';

class OrderRows extends StatelessWidget {
  final String title;
  final String desc;
  const OrderRows({super.key, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(color: AppColor.primary),
          
        ),
        Expanded(child: Text(" : $desc"))
      ],
    );
  }
}
