import 'package:eco_swap_app/core/utils/app_config.dart';
import 'package:eco_swap_app/features/common/widgets/custom_elevated_button.dart';
import 'package:eco_swap_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  CustomErrorWidget({super.key, required this.text, required this.onClick});

  String text;
  VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    var height = AppConfig.height(context);
    var theme = Theme.of(context);
    var language = AppLocalizations.of(context)!;
    return Center(
      child: Column(
        spacing: height * 0.02,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text, style: theme.textTheme.headlineSmall),
          CustomElevatedButton(onClick: onClick, text: language.try_again),
        ],
      ),
    );
  }
}
