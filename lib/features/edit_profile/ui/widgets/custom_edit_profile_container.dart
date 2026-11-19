import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_config.dart';
import '../../../../l10n/app_localizations.dart';

class CustomEditProfileContainer extends StatelessWidget {
  const CustomEditProfileContainer({super.key});

  @override
  Widget build(BuildContext context) {
    var width = AppConfig.width(context);
    var height = AppConfig.height(context);

    var theme = Theme.of(context);
    var language = AppLocalizations.of(context)!;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.03,
        vertical: height * 0.02,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.onInverseSurface,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        spacing: width * 0.03,
        children: [
          SvgPicture.asset(
            AppAssets.leave,
            colorFilter: ColorFilter.mode(
              theme.colorScheme.primary,
              BlendMode.srcIn,
            ),
          ),
          Text(
            language.contact_details_help,
            style: theme.textTheme.displayMedium,
          ),
        ],
      ),
    );
  }
}
