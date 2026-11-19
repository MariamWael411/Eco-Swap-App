import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_config.dart';
import '../../../../l10n/app_localizations.dart';

class CustomSecurityWidget extends StatelessWidget {
  const CustomSecurityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var width = AppConfig.width(context);

    var theme = Theme.of(context);
    var language = AppLocalizations.of(context)!;
    return Row(
      spacing: width * 0.02,
      children: [
        SvgPicture.asset(
          AppAssets.lock,
          colorFilter: ColorFilter.mode(
            theme.colorScheme.primary,
            BlendMode.srcIn,
          ),
        ),
        Text(
          language.contact_information_shared_with_approval,
          style: theme.textTheme.displayMedium?.copyWith(fontSize: 8),
        ),
      ],
    );
  }
}
