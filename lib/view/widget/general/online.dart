import 'package:flutter/material.dart';

class Online extends StatelessWidget {
  const Online({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.02,
        vertical: MediaQuery.of(context).size.height * 0.005,
      ),
      decoration: BoxDecoration(
        // color: Color(0xFFE1F3EB),
        color: Theme.of(context).colorScheme.onBackground,

        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        "online",
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: const Color(0xFF4CBA87), fontWeight: FontWeight.w900),
      ),
    );
  }
}
