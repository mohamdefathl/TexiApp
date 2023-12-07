import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CardMassageCall extends StatelessWidget {
  const CardMassageCall({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.service,
    required this.phoneNumber,
  });
  final IconData icon;
  final Color iconColor;
  final String service;
  final String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        String telephoneNumber = phoneNumber;
        String telephoneUrl = "$service:$telephoneNumber";
        if (await canLaunchUrl(Uri.parse(telephoneUrl))) {
          await launchUrl(Uri.parse(telephoneUrl));
        } else {
          throw "Error occured trying to call that number.";
        }
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Theme.of(context).colorScheme.scrim,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(
            icon,
            color: iconColor,
            size: 24,
          ),
        ),
      ),
    );
  }
}