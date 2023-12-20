import 'package:flutter/material.dart';

class PriceTitleDetailPage extends StatelessWidget {
  const PriceTitleDetailPage(
      {super.key,
      required this.title,
      required this.price,
      required this.isFinal});
  final String title;
  final String price;
  final bool isFinal;

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
            style: !isFinal
                ? Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.grey)
                : Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 13
                    ),
          ),
        ],
      ),
    );
  }
}
