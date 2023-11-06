import 'package:flutter/material.dart';
import 'package:taxiapp/constant/color.dart';

class ButtonMo extends StatelessWidget {
  const ButtonMo({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 47,
        decoration: BoxDecoration(
            color: AppColor.primary,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                color: AppColor.primary.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 1)
              )
            ]),
        child:const Center(
            child: Text(
          "تسجيل الدخول ",
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
