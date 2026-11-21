import 'package:flutter/material.dart';

import '../../../../core/utils/app_config.dart';
import '../../../../l10n/app_localizations.dart';

class CustomCatogeryWidget extends StatelessWidget {
  CustomCatogeryWidget({
    super.key,
    required this.status,
    required this.category,
  });

  String category;
  String status@override
  Widget build(BuildContext context) {
    var width = AppConfig.width(context);

    var height = AppConfig.height(context);
    var theme = Theme.of(context);
    var language = AppLocalizations.of(context)!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.024,
            vertical: height * 0.007,
          ),
          decoration: BoxDecoration(
            color: theme.colorScheme.onInverseSurface,
            borderRadius: BorderRadius.circular(7),
          ),
          child: Text(
            category,
            style: theme.textTheme.bodySmall?.copyWith(fontSize: 10),
          ),
        ),
        Text(
          status,
          style: theme.textTheme.bodySmall?.copyWith(fontSize: 12),
        ),
      ],
    );
  }
}
