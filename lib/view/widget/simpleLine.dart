import 'package:flutter/material.dart';
import 'package:taxiapp/constant/color.dart';

class SimpleLine extends StatelessWidget {
  const SimpleLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin:const EdgeInsets.symmetric(vertical: 7),
        width: MediaQuery.of(context).size.width * 0.8,
        height: 1.5,
        decoration:const BoxDecoration(color: AppColor.primary),
      ),
    );
  }
}