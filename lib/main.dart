import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxiapp/constant/color.dart';
import 'package:taxiapp/view/widget/home.dart';
import 'package:taxiapp/view/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Taxi',      
      theme: themeData(),      
      home: Home(),
      // home: Login(),
    );
  }
}
ThemeData themeData() {
    return ThemeData(
      fontFamily: "Cairo",
      // fontFamily: "PlayfairDisplay",
      textTheme: const TextTheme(
        titleLarge:
            TextStyle(fontWeight: FontWeight.bold, fontSize: 30, height: 2),
        titleMedium: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        titleSmall: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        bodyLarge: TextStyle(
            fontSize: 15,
            height: 1.5,
            color: AppColor.black,
            fontWeight: FontWeight.w600),
        bodyMedium: TextStyle(
            fontSize: 14,
            height: 1.7,
            color: AppColor.black,
            fontWeight: FontWeight.w600),
      ),
      colorScheme: ColorScheme.fromSeed(seedColor: AppColor.black),
      useMaterial3: true,
    );
  }