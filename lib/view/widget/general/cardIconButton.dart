import 'package:flutter/material.dart';
import 'package:taxiapp/constant/color.dart';

class CardIconButtonAppBar extends StatelessWidget {
  const CardIconButtonAppBar({
    super.key,
    required this.icon,
    required this.onCLick,
  });
  final IconData icon;
  final VoidCallback onCLick;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCLick,
      child: Card(
        shadowColor: Theme.of(context).colorScheme.shadow,
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: Icon(
            icon,
            color: AppColor.primary,
          ),
        ),
      ),
    );
  }
}
