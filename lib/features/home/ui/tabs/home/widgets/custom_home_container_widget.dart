import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/utils/app_assets.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_config.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../../../../../cubit/theme_cubit.dart';
import '../../../../../../l10n/app_localizations.dart';

class CustomHomeContainerWidget extends StatelessWidget {
  const CustomHomeContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var width = AppConfig.width(context);
    var height = AppConfig.height(context);
    final isDark = context.read<ThemeCubit>().isDark();

    var language = AppLocalizations.of(context)!;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.03,
      ),
      height: height * 0.14,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(23),
        gradient: LinearGradient(
          colors: [
            isDark ? AppColors.containerColor : AppColors.darkGreenColor,
            isDark ? AppColors.linearGreen2Color : AppColors.greenLightColor,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                language.give_share,
                style: isDark
                    ? AppStyles.extra9MintDarkGreen
                    : AppStyles.extra9MintGreen,
              ),
              Text(
                language.give_something_a_second_life_nearby,
                style: isDark ? AppStyles.bold17Green : AppStyles.bold17White,
              ),
            ],
          ),
          ClipOval(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  radius: 0.53,
                  center: Alignment.center,
                  colors: [
                    AppColors.shadowColor,
                    isDark ? AppColors.transparentColor : AppColors.greenColor,
                  ],
                ),
              ),
              child: SvgPicture.asset(AppAssets.leaveContainer),
            ),
          ),
        ],
      ),
    );
  }
}
