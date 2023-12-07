import 'package:flutter/material.dart';
import 'package:taxiapp/constant/color.dart';

class ButtonMo extends StatelessWidget {
  const ButtonMo({super.key, this.onTap});
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
                  offset: Offset(0, 1))
            ]),
        child: Center(
            child: Text(
          "تسجيل الدخول ",
          style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white),
        )),
      ),
    );
  }
}
