import 'package:flutter/material.dart';
import 'package:taxiapp/view/widget/general/online.dart';

class HistoryPageAppBar extends StatelessWidget {
  const HistoryPageAppBar({
    super.key,
    required this.themeText,
  });

  final TextTheme themeText;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: MediaQuery.of(context).size.height * 0.1,
      title: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "الحساب الشخصي",
              style: themeText.titleLarge,
            ),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Online(),
          )
        ],
      ),
      
      
      pinned: false,
      snap: true,
      floating: true,
      stretch: true,
      elevation: 0.0,
    );
  }
}
