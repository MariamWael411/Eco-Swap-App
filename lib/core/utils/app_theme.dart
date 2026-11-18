
import 'package:eco_swap_app/core/utils/app_colors.dart';
import 'package:eco_swap_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {

  static final ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.whiteColor,
    ),
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
        onSecondary: AppColors.containerTextFieldColor,
        onSecondaryContainer: AppColors.blackColor,
        inversePrimary: AppColors.bageColor,
      inverseSurface: AppColors.whiteColor,
        onInverseSurface: AppColors.lightGreenColor,
        onPrimaryFixed: AppColors.lightRedColor,
        onSecondaryFixedVariant: AppColors.redColor
    ),

    textTheme: TextTheme(
        bodyLarge: AppStyles.reg21Black,
        labelSmall: AppStyles.bold14White,
        titleLarge: AppStyles.bold11LightBlack,
        titleMedium: AppStyles.extra17Black,
        titleSmall: AppStyles.bold15Green,
        bodyMedium: AppStyles.bold11Grey,
        bodySmall: AppStyles.extraBold8Green,
        displayLarge: AppStyles.reg25Black,
        displayMedium: AppStyles.reg10Grey,
        displaySmall: AppStyles.bold11Black,
        headlineLarge: AppStyles.bold11Green,
        headlineMedium: AppStyles.bold14Black,
        headlineSmall: AppStyles.bold18Black,
        labelLarge: AppStyles.extra8Grey,
        labelMedium: AppStyles.reg9Green
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.primaryDarkColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryDarkColor,
    ),
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
        onSecondary: AppColors.containerColor,
        onSecondaryContainer: AppColors.textDarkColor,
        inversePrimary: AppColors.containerColor,
        inverseSurface: AppColors.primaryDarkColor,
        onInverseSurface: AppColors.darkGreen2Color,
        onPrimaryFixed: AppColors.darkRedColor,
        onSecondaryFixedVariant: AppColors.binkColor



    ),
    textTheme: TextTheme(
        bodyLarge: AppStyles.reg21White,
        labelSmall: AppStyles.bold14DarkGreen,
        titleLarge: AppStyles.bold11LightGreen,
        titleMedium: AppStyles.extra17White,
        titleSmall: AppStyles.bold15GreenDark,
        bodyMedium: AppStyles.bold11GreyDark,
        bodySmall: AppStyles.extraBold8GreenDark,
        displayLarge: AppStyles.reg25White,
        displayMedium: AppStyles.reg10LightGreen,
        displaySmall: AppStyles.bold11White,
        headlineLarge: AppStyles.bold11DarkGreen,
        headlineMedium: AppStyles.bold14White,
        headlineSmall: AppStyles.bold18White,
        labelLarge: AppStyles.extra8White,
        labelMedium: AppStyles.reg9DarkGreen





    ),
  );
}

