import 'package:blood_donation_mobile/component/widget_colors.dart';
import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  primaryColor: AppColors.darkBlue,
  secondaryHeaderColor: AppColors.darkBlue,
  brightness: Brightness.light,
  cardColor: AppColors.white,
  colorScheme: const ColorScheme.light(
    primary: AppColors.darkBlue,
    onPrimary: AppColors.white,
    background: AppColors.white,
  ),
  scaffoldBackgroundColor: AppColors.white,
  appBarTheme: const AppBarTheme(
    color: AppColors.darkBlue,
    iconTheme: IconThemeData(color: AppColors.darkBlue),
  ),
  textTheme: const TextTheme(
      titleLarge: TextStyle(color: AppColors.darkGrey),
      displayMedium: TextStyle(color: AppColors.white),
      bodyLarge: TextStyle(color: AppColors.darkGrey),
      bodyMedium: TextStyle(color: AppColors.darkGrey)),
  buttonTheme: const ButtonThemeData(
    buttonColor: AppColors.darkBlue,
    textTheme: ButtonTextTheme.primary,
  ),
  iconTheme: const IconThemeData(color: AppColors.darkBlue),
  dividerColor: AppColors.lightGrey,
);

ThemeData darkMode = ThemeData(
  primaryColor: AppColors.black,
  brightness: Brightness.dark,
  secondaryHeaderColor: AppColors.black,
  cardColor: AppColors.darkGrey,
  colorScheme: const ColorScheme.dark(
    primary: AppColors.white,
    onPrimary: AppColors.black,
    background: AppColors.black,
  ),
  scaffoldBackgroundColor: AppColors.black,
  appBarTheme: const AppBarTheme(
    color: AppColors.black,
    iconTheme: IconThemeData(color: AppColors.white),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(color: AppColors.darkGrey),
    displayMedium: TextStyle(color: AppColors.darkGrey),
    bodyLarge: TextStyle(color: AppColors.lightGrey),
    bodyMedium: TextStyle(color: AppColors.white),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: AppColors.black,
      backgroundColor: AppColors.white,
    ),
  ),
  iconTheme: const IconThemeData(color: AppColors.white),
  dividerColor: AppColors.lightGrey,
);
