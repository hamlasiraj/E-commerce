import 'package:flutter/material.dart';
import 'colors.dart';

ThemeData englishTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  fontFamily: "Roboto",
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 25, color: AppColor.black),
    headlineMedium: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 20, color: AppColor.black),
    bodyLarge: TextStyle(
        height: 2,
        color: AppColor.grey,
        fontWeight: FontWeight.bold,
        fontSize: 17),
  ),
);

ThemeData arabicTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  fontFamily: "Cairo",
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 25, color: AppColor.black),
    headlineMedium: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 20, color: AppColor.black),
    bodyLarge: TextStyle(
        height: 2,
        color: AppColor.grey,
        fontWeight: FontWeight.bold,
        fontSize: 17),
  ),
);
