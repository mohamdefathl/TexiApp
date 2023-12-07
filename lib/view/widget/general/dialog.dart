import 'package:flutter/material.dart';
import 'package:get/get.dart';

dialog({
  required String title,
  required String content,
  required VoidCallback onPress,
  required String buttonTitle,
}) {
  Get.defaultDialog(
    titlePadding: const EdgeInsets.all(10),
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    radius: 19,
    title: title,
    titleStyle: const TextStyle(
      fontFamily: "Cairo",
      fontSize: 20,
    ),
    content: Text(
      content,
      textAlign: TextAlign.right,
      style: const TextStyle(
          fontFamily: "Cairo", fontSize: 16, color: Colors.white70),
    ),
    cancel: Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton(
        onPressed: onPress,
        child: Text(
          buttonTitle,
          style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}
