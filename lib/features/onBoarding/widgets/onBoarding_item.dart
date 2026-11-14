import 'package:flutter/material.dart';

import '../../../../core/utils/app_config.dart';

class OnboardingItem extends StatelessWidget {
  String title;
  String body;
  String image;
  int index;

  OnboardingItem({
    super.key,
    required this.image,
    required this.body,
    required this.title,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    var height = AppConfig.height(context);
    var theme = Theme.of(context);
    return Column(
      spacing: height * 0.009,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(image),
        Text(
          "0${index + 1} / 03",
          style: theme.textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
        Text(
          title,
          style: theme.textTheme.displayLarge,
          textAlign: TextAlign.center,
        ),
        Text(
          body,
          style: theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
