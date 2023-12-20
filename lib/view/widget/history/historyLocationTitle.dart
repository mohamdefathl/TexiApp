import 'package:flutter/material.dart';

class HistoryLocationTitle extends StatelessWidget {
  const HistoryLocationTitle({
    super.key,
    required this.themeText,
    required this.title,
  });

  final TextTheme themeText;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style:
              themeText.titleSmall!.copyWith(color: Colors.grey, fontSize: 11),
        ),
        const Icon(
          Icons.location_on,
          color: Colors.grey,
          size: 14,
        ),
      ],
    );
  }
}
