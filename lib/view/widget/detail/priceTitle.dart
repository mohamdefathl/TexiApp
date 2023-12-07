import 'package:flutter/material.dart';

class PriceTitleDetailPage extends StatelessWidget {
  const PriceTitleDetailPage({
    super.key,
    required this.title,
    required this.price,
  });
  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Text(
            "ريال $price",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const Spacer(),
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}