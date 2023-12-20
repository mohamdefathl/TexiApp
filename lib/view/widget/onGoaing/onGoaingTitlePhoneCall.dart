import 'package:flutter/material.dart';
import 'package:taxiapp/constant/color.dart';
import 'package:taxiapp/view/widget/general/CardMessageRow.dart';

class OnGoingTitlePhoneCall extends StatelessWidget {
  const OnGoingTitlePhoneCall({
    super.key,
    required this.themeText,
    required this.title,
    required this.phone,
    required this.image,
  });

  final TextTheme themeText;
  final String title;
  final String phone;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.04),
      child: Row(
        children: [
          CardMessageRow(phoneNumber: phone),
          const Spacer(),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style:
                        themeText.titleSmall!.copyWith(color: AppColor.primary),
                  ),
                  Text(
                    phone,
                    style: themeText.titleSmall!
                        .copyWith(color: Color(0xFF4CBA87), fontSize: 11),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.02,
              ),
              Image.asset(
                image,
                width: 27,
                height: 27,
              ),
            ],
          )
        ],
      ),
    );
  }
}