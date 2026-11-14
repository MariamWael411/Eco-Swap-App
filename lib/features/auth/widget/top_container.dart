import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_config.dart';
import '../../../core/utils/app_styles.dart';
import '../../../cubit/theme_cubit.dart';

class TopContainer extends StatelessWidget {
  const TopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    var width = AppConfig.width(context);
    var height = AppConfig.height(context);
    final isDark = context.read<ThemeCubit>().isDark();
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          radius: 0.35,
          center: Alignment.center,
          colors: [
            AppColors.shadowColor,
            isDark ? AppColors.transparentColor : AppColors.greenColor,
          ],
        ),
      ),

      child: Column(
        spacing: height * 0.013,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: height * 0.1),
          Image.asset(
            AppAssets.logo,
            width: width * 0.17,
            height: height * 0.07,
          ),
          Text(
            "EcoSwap",
            style: AppStyles.reg27White,
            textAlign: TextAlign.center,
          ),
          Text(
            "Give Items a Second Life.",
            style: AppStyles.reg11Green,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
