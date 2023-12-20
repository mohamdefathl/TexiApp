import 'package:flutter/material.dart';

class CardStaticsHistoryPage extends StatelessWidget {
  const CardStaticsHistoryPage({
    super.key,
    required this.themeText, required this.value, required this.icon, required this.title,
  });

  final TextTheme themeText;
  final double value;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.3,
      // padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Card(
        color: Theme.of(context).colorScheme.onPrimary,        
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xFF0CB0FF),
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Icon(
                      icon,
                      size: 30,
                      color: Colors.white,
                    ),
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.007,
              ),
              Text(
                "$value ريال +",
                style: themeText.titleSmall!.copyWith(
                    color: Color(0xFF1E80ED),
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1.4,
                    fontSize: 16),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.007,
              ),
              Text(
                title,
                style: themeText.titleSmall!
                    .copyWith(color: Colors.grey, fontSize: 12),
              )
            ],
          ),
        ),
      ),
    );
  }
}