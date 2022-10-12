import 'package:ecommerce_1/core/constants/colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData enThemeData = ThemeData(
    fontFamily: 'PlayfairDisplay',
    textTheme: AppThemes.appTextTheme,
    primaryColor: AppColors.primaryColor,
  );

  static ThemeData arThemeData = ThemeData(
    fontFamily: 'Cairo',
    textTheme: AppThemes.appTextTheme,
    primaryColor: AppColors.primaryColor,
  );

  static const TextTheme appTextTheme = TextTheme(
    headline1: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: AppColors.blackColor,
    ),
    headline2: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: AppColors.greyColor,
    ),
    bodyText1: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 15,
      color: AppColors.greyColor,
      height: 1.5,
    ),
  );
}
