import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/utils/app_assets.dart';
import '../../../../../../core/utils/app_config.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../../../../../cubit/theme_cubit.dart';
import '../../../../../../l10n/app_localizations.dart';

class CustomHomeTopSectionWidget extends StatelessWidget {
  String name;

  CustomHomeTopSectionWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    var width = AppConfig.width(context);
    var height = AppConfig.height(context);
    final isDark = context.read<ThemeCubit>().isDark();
    var theme = Theme.of(context);
    var language = AppLocalizations.of(context)!;
    String nameCap = name
        .split(' ')
        .map((word) {
          if (word.isEmpty) return word;

          return word[0].toUpperCase() + word.substring(1).toLowerCase();
        })
        .join(' ');

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            spacing: height * 0.01,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "${language.good_morning} $nameCap",
                style: isDark ? AppStyles.sem11LightGreen : AppStyles.sem11Grey,
              ),
              Row(
                spacing: width * 0.01,
                children: [
                  SvgPicture.asset(
                    AppAssets.leaveLogo,
                    colorFilter: ColorFilter.mode(
                      theme.colorScheme.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                  Text(
                    "EcoSwap",
                    style: isDark
                        ? AppStyles.bold22DarkGreen
                        : AppStyles.bold22Green,
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.03,
            vertical: height * 0.0134,
          ),
          decoration: BoxDecoration(
            color: theme.colorScheme.onInverseSurface,
            borderRadius: BorderRadius.circular(11),
          ),
          child: SvgPicture.asset(
            isDark ? AppAssets.themeDarkIcon : AppAssets.themeLightIcon,
            colorFilter: ColorFilter.mode(
              theme.colorScheme.primary,
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }
}
