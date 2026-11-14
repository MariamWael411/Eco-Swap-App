import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';

class CustomForgetPassWidget extends StatelessWidget {
  VoidCallback onClick;

  CustomForgetPassWidget({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var language = AppLocalizations.of(context)!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: onClick,
          child: Text(
            language.forgot_password,
            style: theme.textTheme.headlineLarge,
          ),
        ),
      ],
    );
  }
}
