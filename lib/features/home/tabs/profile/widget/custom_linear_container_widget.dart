import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_config.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../cubit/theme_cubit.dart';
import '../../../../../l10n/app_localizations.dart';

class CustomLinearContainerWidget extends StatelessWidget {
  const CustomLinearContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var height = AppConfig.height(context);
    final isDark = context.read<ThemeCubit>().isDark();
    var language = AppLocalizations.of(context)!;
    return Container(
      width: double.infinity,
      height: height * 0.13,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: isDark ? AppColors.dotColor : AppColors.transparentColor,
        ),
        gradient: LinearGradient(
          colors: [
            isDark ? AppColors.containerColor : AppColors.darkGreenColor,
            isDark ? AppColors.linearGreen2Color : AppColors.greenLightColor,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: Column(
        spacing: height * 0.01,
        children: [
          SizedBox(height: height * 0.005),
          SvgPicture.asset(isDark ? AppAssets.leaveDark : AppAssets.leaveLight),
          Text(
            language.items_shared,
            style: isDark ? AppStyles.bold12LightGrey : AppStyles.bold12White,
          ),
          Text(
            language.you_are_helping_your_community_wastel_ess,
            style: isDark ? AppStyles.reg8B7 : AppStyles.reg8DA,
          ),
        ],
      ),
    );
  }
}
