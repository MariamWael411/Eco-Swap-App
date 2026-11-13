
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
        onPrimaryContainer: AppColors.greyColor,
        onPrimary: AppColors.lightGreyColor,
        onSecondary: AppColors.containerTextFieldColor
    ),

    textTheme: TextTheme(
        bodyLarge: AppStyles.reg21Black,
        labelSmall: AppStyles.bold14White,
        titleLarge: AppStyles.bold11LightBlack

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
        onPrimaryContainer: AppColors.lightGreenPrimaryColor,
        onPrimary: AppColors.dotColor,
        onSecondary: AppColors.containerColor
    ),
    textTheme: TextTheme(
        bodyLarge: AppStyles.reg21White,
        labelSmall: AppStyles.bold14DarkGreen,
        titleLarge: AppStyles.bold11LightGreen



    ),
  );
}

