import 'package:flutter/material.dart';
import 'package:taxiapp/constant/color.dart';

class OrderRowFromTo extends StatelessWidget {
  const OrderRowFromTo({
    super.key,
    required this.location,
    required this.title,
  });

  final String location;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
            child: Text(
          location,
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
          textAlign: TextAlign.end,
          style: Theme.of(context).textTheme.titleSmall,
        )),
        const SizedBox(width: 8), //
        Text(
          " : $title",
          style:Theme.of(context).textTheme.titleSmall!.copyWith(color: AppColor.primary),
        )
      ],
    );
  }
}
