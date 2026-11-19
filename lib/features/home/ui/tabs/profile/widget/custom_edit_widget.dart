import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/app_assets.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_config.dart';
import '../../../../../../cubit/theme_cubit.dart';
import '../../../../../../l10n/app_localizations.dart';

class CustomEditWidget extends StatelessWidget {
  CustomEditWidget({super.key, required this.onTap});

  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    var width = AppConfig.width(context);
    var height = AppConfig.height(context);
    final isDark = context.read<ThemeCubit>().isDark();

    var theme = Theme.of(context);
    var language = AppLocalizations.of(context)!;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.023),
      height: height * 0.042,
      decoration: BoxDecoration(
        color: isDark ? AppColors.containerColor : AppColors.transparentColor,
        borderRadius: BorderRadius.circular(11),
        border: Border.all(color: theme.colorScheme.onPrimary),
      ),

      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: width * 0.03,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.edit,
              color: !isDark ? AppColors.blackColor : AppColors.textDarkColor,
            ),
            Text(language.edit_profile, style: theme.textTheme.displaySmall),
          ],
        ),
      ),
    );
  }
}
