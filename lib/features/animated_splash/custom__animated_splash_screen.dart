import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:eco_swap_app/core/utils/app_assets.dart';
import 'package:eco_swap_app/core/utils/app_colors.dart';
import 'package:eco_swap_app/core/utils/app_config.dart';
import 'package:eco_swap_app/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../onBoarding/onBoarding_screen.dart';

class CustomAnimatedSplashScreen extends StatelessWidget {
  const CustomAnimatedSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var isDark = context.read<ThemeCubit>().isDark();
    var height = AppConfig.height(context);
    return AnimatedSplashScreen(
      splash: Lottie.asset(isDark ? AppAssets.splashDark : AppAssets.splash),
      backgroundColor: isDark ? AppColors.containerColor : AppColors.greenColor,
      splashIconSize: height * 0.2,
      duration: 3000,
      nextScreen: OnboardingScreen(),
    );
  }
}
