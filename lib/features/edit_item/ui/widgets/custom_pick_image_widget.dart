import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_config.dart';
import '../../../../l10n/app_localizations.dart';

class CustomPickImageWidget extends StatelessWidget {
  const CustomPickImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var width = AppConfig.width(context);
    var height = AppConfig.height(context);
    var theme = Theme.of(context);
    var language = AppLocalizations.of(context)!;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: height * 0.034),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        color: theme.colorScheme.onInverseSurface,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: height * 0.01,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.021,
              vertical: height * 0.01,
            ),
            decoration: BoxDecoration(
              color: theme.colorScheme.inverseSurface,
              borderRadius: BorderRadius.circular(11),
            ),
            child: SvgPicture.asset(
              AppAssets.camera,
              colorFilter: ColorFilter.mode(
                theme.colorScheme.primary,
                BlendMode.srcIn,
              ),
            ),
          ),
          Text(
            language.add_one_clear_photo,
            style: theme.textTheme.displaySmall?.copyWith(fontSize: 12),
          ),
          Text(
            language.natural_light_photo,
            style: theme.textTheme.displayMedium?.copyWith(fontSize: 9),
          ),
        ],
      ),
    );
  }
}
