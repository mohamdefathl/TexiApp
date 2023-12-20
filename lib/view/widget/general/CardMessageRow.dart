import 'package:flutter/material.dart';
import 'package:taxiapp/constant/color.dart';
import 'package:taxiapp/view/widget/general/cardMassageCall.dart';

class CardMessageRow extends StatelessWidget {
  const CardMessageRow({
    super.key,
    required this.phoneNumber,
  });

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CardMassageCall(
            icon: Icons.message,
            iconColor: AppColor.primary,
            service: 'sms',
            phoneNumber: phoneNumber),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.02,
        ),
        CardMassageCall(
            icon: Icons.call,
            iconColor: Colors.green,
            service: 'tel',
            phoneNumber: phoneNumber),
      ],
    );
  }
}
