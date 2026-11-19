import 'package:flutter/material.dart';

import '../../../../core/utils/app_config.dart';
import '../../../../l10n/app_localizations.dart';

class CustomConditionWidget extends StatelessWidget {
  bool isActive;
  int index;

  CustomConditionWidget({
    super.key,
    required this.isActive,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    var width = AppConfig.width(context);
    var height = AppConfig.height(context);
    var theme = Theme.of(context);
    var language = AppLocalizations.of(context)!;
    List<String> conditions = [
      language.like_new,
      language.good,
      language.well_used,
    ];
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      curve: Curves.easeIn,
      width: width * 0.28,
      margin: EdgeInsets.symmetric(horizontal: width * 0.01),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isActive
            ? theme.colorScheme.onInverseSurface
            : theme.colorScheme.onPrimaryFixedVariant,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: isActive ? 2 : 1,
          color: isActive
              ? theme.colorScheme.onSecondaryFixed
              : theme.colorScheme.onPrimary,
        ),
      ),
      child: Text(
        conditions[index],
        style: isActive
            ? theme.textTheme.headlineLarge
            : theme.textTheme.bodyMedium,
      ),
    );
  }
}
