import 'package:eco_swap_app/core/utils/app_config.dart';
import 'package:flutter/material.dart';

class CustomHeaderWidget extends StatelessWidget {
  String text1;
  String text2;

  CustomHeaderWidget({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var height = AppConfig.height(context);
    return Column(
      spacing: height * 0.013,
      children: [
        Text(
          text1,
          style: theme.textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        Text(
          text2,
          style: theme.textTheme.displayMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
