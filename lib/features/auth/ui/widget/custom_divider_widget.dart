import 'package:flutter/material.dart';

import '../../../../core/utils/app_config.dart';
import '../../../../l10n/app_localizations.dart';

class CustomDividerWidget extends StatelessWidget {
  const CustomDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var width = AppConfig.width(context);

    var theme = Theme.of(context);
    var language = AppLocalizations.of(context)!;
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: theme.colorScheme.onPrimary,
            endIndent: width * 0.02,
          ),
        ),
        Text(language.or_continue_with, style: theme.textTheme.displayMedium),
        Expanded(
          child: Divider(
            color: theme.colorScheme.onPrimary,
            indent: width * 0.02,
          ),
        ),
      ],
    );
  }
}
