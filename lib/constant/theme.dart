import 'package:flutter/material.dart';
import 'package:taxiapp/constant/color.dart';

final lightTheme = ThemeData.light().copyWith(
  navigationBarTheme: _getNavigationBarThemeData(Colors.white, Colors.grey),
  appBarTheme: _getAppBarThemeData(AppColor.whiteSecond),
  textSelectionTheme: _getTextSelectionThemeData(),
  textTheme: _getCommonTextTheme(Colors.black),
  cardTheme: _getCardTheme(),
  dividerTheme:_getDividerThemeData(),
  scaffoldBackgroundColor: AppColor.whiteSecond,
  colorScheme: const ColorScheme.light().copyWith(
    background: Colors.white,
    secondary: Colors.black,
    shadow: Colors.grey.shade300,
    scrim: Colors.grey.shade200,
    surface: Colors.grey.withOpacity(0.09),
  ),
  elevatedButtonTheme: _getElevatedButtonThemeData(),
);

final darkTheme = ThemeData.dark().copyWith(
  navigationBarTheme:
      _getNavigationBarThemeData(const Color(0xff363536), Colors.white),
  appBarTheme: _getAppBarThemeData(AppColor.blackSecond),
  textSelectionTheme: _getTextSelectionThemeData(),
  textTheme: _getCommonTextTheme(Colors.white),
  cardTheme: _getCardTheme(),
  dividerTheme: _getDividerThemeData(),
  scaffoldBackgroundColor: AppColor.blackSecond,
  colorScheme: const ColorScheme.dark().copyWith(
      background: const Color(0xff363536),
      secondary: Colors.white,
      shadow: AppColor.blackFirst.withOpacity(0.5),
      scrim: AppColor.blackFirst.withOpacity(0.5),
      surface: AppColor.blackFirst.withOpacity(0.2)),
  elevatedButtonTheme: _getElevatedButtonThemeData(),
);

TextSelectionThemeData _getTextSelectionThemeData() {
  return const TextSelectionThemeData(
    selectionColor: AppColor.primary,
    selectionHandleColor: AppColor.primary,
  );
}

AppBarTheme _getAppBarThemeData(Color color) {
  return AppBarTheme(
      backgroundColor: color, scrolledUnderElevation: 0, elevation: 0);
}
DividerThemeData _getDividerThemeData() {
  return const  DividerThemeData(color: AppColor.primary,thickness: 0.9);
}

NavigationBarThemeData _getNavigationBarThemeData(
    Color color, Color textColor) {
  return NavigationBarThemeData(
      backgroundColor: color,
      labelTextStyle: MaterialStateTextStyle.resolveWith(
        (states) => TextStyle(
            fontSize: 10,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.bold,
            color: textColor),
      ));
}

TextTheme _getCommonTextTheme(Color color) {
  return TextTheme(
    titleLarge: TextStyle(
      fontFamily: "Cairo",
      fontWeight: FontWeight.bold,
      fontSize: 25,
      color: color,
    ),
    titleMedium: TextStyle(
      fontFamily: "Cairo",
      fontWeight: FontWeight.w600,
      color: color,
      fontSize: 18,
    ),
    titleSmall: TextStyle(
      fontFamily: "Cairo",
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 14,
    ),
  );
}

ElevatedButtonThemeData _getElevatedButtonThemeData() {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontFamily: "Cairo"),
      backgroundColor: AppColor.primary,
      elevation: 6,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    ),
  );
}

CardTheme _getCardTheme() {
  return const CardTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
  );
}
