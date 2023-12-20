import 'package:flutter/material.dart';
import 'package:taxiapp/constant/color.dart';

class UserTitleDetailPage extends StatelessWidget {
  const UserTitleDetailPage({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });
  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(
            icon,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            value,
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