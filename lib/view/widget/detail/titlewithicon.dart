import 'package:flutter/material.dart';

class TitleWithIconDetailPage extends StatelessWidget {
  const TitleWithIconDetailPage({
    super.key,
    required this.title,
    required this.image,
  });
  final String title;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(
            width: 7,
          ),
          Image.asset(
            image,
            width: 30,
            height: 30,
          ),
        ],
      ),
    );
  }
}