import 'package:flutter/material.dart';

import '../../../../../core/utils/app_config.dart';

class CustomRowWidget extends StatelessWidget {
  String text1;
  String text2;
  String icon;
  Widget widget;
  Color? containerColor;
  Color? iconColor;

  CustomRowWidget({
    super.key,
    required this.widget,
    required this.text1,
    required this.text2,
    required this.icon,
    this.containerColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    var width = AppConfig.width(context);
    var height = AppConfig.height(context);

    var theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.033,
        vertical: height * 0.015,
      ),
      child: Row(
        spacing: width * 0.04,
        children: [
          Container(
            width: width * 0.097,
            height: height * 0.045,
            decoration: BoxDecoration(
              color: containerColor ?? theme.colorScheme.onInverseSurface,
              borderRadius: BorderRadius.circular(11),
            ),
            child: Image.asset(
              icon,
              color: iconColor ?? theme.colorScheme.primary,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: height * 0.01,
            children: [
              Text(text1, style: theme.textTheme.displaySmall),
              Text(
                text2,
                style: theme.textTheme.displayMedium?.copyWith(fontSize: 8),
              ),
            ],
          ),
          Spacer(),
          widget,
        ],
      ),
    );
  }
}
