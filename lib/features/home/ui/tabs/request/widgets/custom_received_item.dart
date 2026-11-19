import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_config.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../../../../../cubit/theme_cubit.dart';
import '../../../../../../l10n/app_localizations.dart';
import '../../../../../common/widgets/custom_elevated_button.dart';

class CustomReceivedItem extends StatelessWidget {
  const CustomReceivedItem({super.key});

  @override
  Widget build(BuildContext context) {
    var width = AppConfig.width(context);
    var height = AppConfig.height(context);
    final isDark = context.read<ThemeCubit>().isDark();
    var theme = Theme.of(context);
    var language = AppLocalizations.of(context)!;
    String text = language.pending;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.03,
        vertical: height * 0.014,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.01,
        vertical: height * 0.01,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimaryFixedVariant,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: theme.colorScheme.onPrimary),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: height * 0.02,
        children: [
          Row(
            spacing: width * 0.03,
            children: [
              ClipOval(
                child: Container(
                  alignment: Alignment.center,
                  width: 0.091 * width,
                  height: height * 0.04,

                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColors.linearColor, AppColors.linear2Color],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                  ),
                  child: Text(
                    "MN",
                    style: AppStyles.extra20Green.copyWith(fontSize: 9),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  spacing: height * 0.01,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("Omar Khaled", style: theme.textTheme.displaySmall),
                    Text(
                      "Requested 18 min ago",
                      style: theme.textTheme.displayMedium,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.024,
                  vertical: height * 0.007,
                ),
                decoration: BoxDecoration(
                  color: text == language.accepted
                      ? theme.colorScheme.onInverseSurface
                      : theme.colorScheme.onSurfaceVariant,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Text(
                  text,
                  style: text == language.accepted
                      ? theme.textTheme.bodySmall
                      : (isDark
                            ? AppStyles.extra8DarkYellow
                            : AppStyles.extra8Yellow),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.03,
              vertical: height * 0.013,
            ),
            decoration: BoxDecoration(
              color: theme.colorScheme.onSecondary,
              borderRadius: BorderRadius.circular(13),
            ),
            child: Row(
              spacing: width * 0.03,
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(9),
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    height: height * 0.06,
                    width: width * 0.13,
                    imageUrl:
                        "https://images.unsplash.com/photo-1497250681960-ef046c08a56e?w=500",
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                        color: AppColors.greenColor,
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Expanded(
                  child: Column(
                    spacing: height * 0.01,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        language.item_request,
                        style: theme.textTheme.labelLarge,
                      ),
                      Text(
                        "Wireless Headphones",
                        style: theme.textTheme.displaySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: text == language.pending,
            child: Row(
              spacing: width * 0.03,
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    onClick: () {},
                    backgroundColor: isDark
                        ? AppColors.containerColor
                        : AppColors.whiteColor,
                    borderColor: theme.colorScheme.onPrimary,
                    item: Row(
                      spacing: width * 0.02,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.close,
                          color: !isDark
                              ? AppColors.blackColor
                              : AppColors.textDarkColor,
                        ),
                        Text(
                          language.decline,
                          style: theme.textTheme.headlineMedium,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CustomElevatedButton(
                    onClick: () {},
                    item: Row(
                      spacing: width * 0.02,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check,
                          color: !isDark
                              ? AppColors.whiteColor
                              : AppColors.blackColor,
                        ),
                        Text(
                          language.accept,
                          style: theme.textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
