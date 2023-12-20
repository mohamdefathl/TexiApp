import 'package:flutter/material.dart';
import 'package:taxiapp/constant/color.dart';

final lightTheme = ThemeData.light().copyWith(
  navigationBarTheme: _getNavigationBarThemeData(Colors.white, Colors.grey),
  appBarTheme: _getAppBarThemeData(AppColor.whiteSecond),
  textSelectionTheme: _getTextSelectionThemeData(),
  textTheme: _getCommonTextTheme(Colors.black),
  cardTheme: _getCardTheme(Colors.black12),
  dividerTheme: _getDividerThemeData(),
  scaffoldBackgroundColor: AppColor.whiteSecond,
  colorScheme: const ColorScheme.light().copyWith(
    background: Colors.white,
    primary: AppColor.primary,
    secondary: Colors.black,
    shadow: Colors.black12,
    scrim: const Color(0xFFF6F6F6),
    surface: Colors.grey.withOpacity(0.09),
    surfaceTint: const Color(0xFFEDF2F7),
    outline: const Color(0xFFC0E2FF), //detail button
    tertiary: const Color(0xFF004C8E), //detail button
    inversePrimary: const Color(0xFFEFF8FF),
    inverseSurface: const Color(0xFF004C8E),
    onInverseSurface:  const Color(0xFFEEFCF5),
    onPrimary: const Color.fromARGB(255, 222, 237, 255),
    onBackground: const Color(0xFFE1F3EB)
  ),
  elevatedButtonTheme: _getElevatedButtonThemeData(),
);

final darkTheme = ThemeData.dark().copyWith(
  navigationBarTheme:
      _getNavigationBarThemeData(const Color(0xff363536), Colors.white),
  appBarTheme: _getAppBarThemeData(AppColor.blackSecond),
  textSelectionTheme: _getTextSelectionThemeData(),
  textTheme: _getCommonTextTheme(Colors.white),
  cardTheme: _getCardTheme(Colors.black54),
  dividerTheme: _getDividerThemeData(),
  scaffoldBackgroundColor: AppColor.blackSecond,
  colorScheme: const ColorScheme.dark().copyWith(
    background: const Color(0xff363536),
    primary: AppColor.primaryDark,
    secondary: Colors.white,
    shadow: Colors.black54,
    scrim: AppColor.blackFirst.withOpacity(0.5),
    surface: AppColor.blackFirst.withOpacity(0.2),
    surfaceTint: AppColor.blackSecond,
    outline: const Color(0xFF004C8E), //detail button
    tertiary: const Color(0xFFC0E2FF), //detail button
    inversePrimary: AppColor.blackSecond,
    inverseSurface: const Color(0xFFEFF8FF),
    onInverseSurface: const Color(0xFF10403E),
    onPrimary: const Color(0xFF053A55),
    onBackground: const Color(0xFF10403E)
  ),
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
  return const DividerThemeData(color: AppColor.primary, thickness: 2);
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
          color: textColor,
        ),
      ));
}

TextTheme _getCommonTextTheme(Color color) {
  return TextTheme(
    titleLarge: TextStyle(
      fontFamily: "Cairo",
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: color,
    ),
    titleMedium: TextStyle(
      fontFamily: "Cairo",
      fontWeight: FontWeight.w600,
      color: color,
      fontSize: 15,
    ),
    titleSmall: TextStyle(
      fontFamily: "Cairo",
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 12.5,
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

CardTheme _getCardTheme(Color color) {
  return CardTheme(
    elevation: 7,
    shadowColor: color,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
  );
}
