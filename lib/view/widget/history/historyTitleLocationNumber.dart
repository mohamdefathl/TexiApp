import 'package:flutter/material.dart';
import 'package:taxiapp/view/widget/general/CardMessageRow.dart';
import 'package:taxiapp/view/widget/history/historyLocationTitle.dart';

class HistoryTitleLocationNumber extends StatelessWidget {
  
  const HistoryTitleLocationNumber({
    super.key,
    required this.themeText,
    required this.title,
    required this.phoneNumber,
    required this.location,
  });

  final TextTheme themeText;
  final String title;
  final String phoneNumber;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              phoneNumber,
              style: themeText.titleSmall!
                  .copyWith(color: Color(0xFF4CBA87), fontSize: 12),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: themeText.titleSmall!.copyWith(fontSize: 12),
                ),
                HistoryLocationTitle(
                  themeText: themeText,
                  title: location ,
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05),
          child: CardMessageRow(phoneNumber: phoneNumber),
        )
      ],
    );
  }
}