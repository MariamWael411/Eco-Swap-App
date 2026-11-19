import 'package:eco_swap_app/core/utils/app_colors.dart';
import 'package:eco_swap_app/features/home/ui/tabs/home/model/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/utils/app_config.dart';
import '../../../../../../cubit/theme_cubit.dart';
import '../../../../../../l10n/app_localizations.dart';

class CustomListViewItem extends StatelessWidget {
  CustomListViewItem({super.key, required this.index, required this.isActive});

  int index;
  bool isActive;

  @override
  Widget build(BuildContext context) {
    Category.context = context;
    var width = AppConfig.width(context);
    var height = AppConfig.height(context);
    final isDark = context.read<ThemeCubit>().isDark();
    var theme = Theme.of(context);

    var language = AppLocalizations.of(context)!;
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
      margin: EdgeInsets.symmetric(horizontal: width * 0.01),
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.034,
        vertical: height * 0.01,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isActive
            ? theme.colorScheme.primary
            : theme.colorScheme.onPrimaryFixedVariant,
        border: Border.all(
          color: isActive
              ? AppColors.transparentColor
              : theme.colorScheme.onPrimary,
        ),
      ),
      child: Row(
        spacing: width * 0.02,
        children: [
          SvgPicture.asset(
            Category.catogeries()[index].icon,
            colorFilter: ColorFilter.mode(
              isActive
                  ? theme.colorScheme.inverseSurface
                  : theme.colorScheme.onPrimaryContainer,
              BlendMode.srcIn,
            ),
          ),
          Text(
            Category.catogeries()[index].name,
            style: isActive
                ? theme.textTheme.labelSmall?.copyWith(fontSize: 11)
                : theme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
