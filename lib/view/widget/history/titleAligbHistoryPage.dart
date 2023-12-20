import 'package:flutter/material.dart';

class TitleAlignHistoryPage extends StatelessWidget {
  const TitleAlignHistoryPage({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.04,
          vertical: MediaQuery.of(context).size.height * 0.01,
        ),
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            title,
            textAlign: TextAlign.end,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}