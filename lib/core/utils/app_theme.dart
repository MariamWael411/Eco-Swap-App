
import 'package:eco_swap_app/core/utils/app_colors.dart';
import 'package:eco_swap_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.whiteColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.whiteColor,
      selectedItemColor: AppColors.greenColor,
      unselectedItemColor: AppColors.greyColor,
      selectedLabelStyle: AppStyles.extra9NavGreen,
      unselectedLabelStyle: AppStyles.reg9Grey,
    ),
    colorScheme: ColorScheme.light(
        primary: AppColors.greenColor,
    ),

    textTheme: TextTheme(
        bodyLarge: AppStyles.reg21Black,

    ),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.primaryDarkColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.dotColor,
      selectedItemColor: AppColors.darkGreenPrimaryColor,
      unselectedItemColor: AppColors.lightGreenPrimaryColor,
      selectedLabelStyle: AppStyles.extra9NavDarkGreen,
      unselectedLabelStyle: AppStyles.reg9LightGreen,
    ),
    colorScheme: ColorScheme.dark(
        primary: AppColors.secondaryDarkColor,
    ),
    textTheme: TextTheme(
        bodyLarge: AppStyles.reg21White,


    ),
  );
}

