import 'package:flutter/material.dart';

class OnGoainglocation extends StatelessWidget {
  const OnGoainglocation({
    super.key,
    required this.themeText,
    required this.title,
  });

  final TextTheme themeText;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            title,
            style: themeText.titleSmall!
                .copyWith(color: Colors.grey, fontSize: 11),
          ),
          const Icon(
            Icons.location_on,
            color: Colors.grey,
            size: 14,
          ),
        ],
      ),
    );
  }
}