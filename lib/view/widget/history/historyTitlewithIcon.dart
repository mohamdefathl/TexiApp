import 'package:flutter/material.dart';

class HistoryMainTitleWithIcon extends StatelessWidget {
  

  const HistoryMainTitleWithIcon({
    super.key,
    required this.themeText,
    required this.image,
    required this.title,
  });

  final TextTheme themeText;
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          title,
          style: themeText.titleSmall!
              .copyWith(color:Theme.of(context).colorScheme.primary, fontSize: 14),
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
    );
  }
}