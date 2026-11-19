import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/utils/app_config.dart';
import '../../../../../../cubit/theme_cubit.dart';

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
    final isDark = context.read<ThemeCubit>().isDark();

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
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.021,
                vertical: height * 0.01
            ),
            decoration: BoxDecoration(
              color: containerColor ?? theme.colorScheme.onInverseSurface,
              borderRadius: BorderRadius.circular(11),
            ),
            child:
            SvgPicture.asset(
              icon,
              key: ValueKey(icon),
              colorFilter: ColorFilter.mode(
                iconColor ?? theme.colorScheme.primary,
                BlendMode.srcIn,
              ),
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
