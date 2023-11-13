import 'package:flutter/material.dart';
import 'package:taxiapp/constant/color.dart';
import 'package:taxiapp/view/widget/BottomBar.dart';
import 'package:taxiapp/functions/test.dart';
import 'package:taxiapp/view/pages/login/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Taxi',
      theme: themeData(),
      home: Home(),
      // home: Test(),
      // home: Login(),
    );
  }
}

ThemeData themeData() {
  return ThemeData(
    fontFamily: "Cairo",
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          height: 2,
          color: Colors.white),
      titleMedium: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 18,
      ),
      titleSmall: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      bodyLarge: TextStyle(
          fontSize: 15,
          height: 1.5,
          // color: AppColor.black,
          color: Colors.white,
          fontWeight: FontWeight.w600),
      bodyMedium: TextStyle(
          fontSize: 14,
          height: 1.7,
          // color: AppColor.black,
          color: Colors.white,
          fontWeight: FontWeight.w600),
    ),
    // colorScheme: ColorScheme.fromSeed(seedColor: AppColor.black),
    useMaterial3: true,
  );
}
