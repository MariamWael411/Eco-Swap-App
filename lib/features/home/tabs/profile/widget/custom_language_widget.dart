import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_config.dart';
import '../../../../../cubit/theme_cubit.dart';

class CustomLanguageWidget extends StatelessWidget {
  CustomLanguageWidget({
    super.key,
    required this.chooseAr,
    required this.chooseEn,
    required this.widget1,
    required this.widget2,
  });

  VoidCallback chooseEn;
  VoidCallback chooseAr;
  Widget widget1;
  Widget widget2;

  @override
  Widget build(BuildContext context) {
    var width = AppConfig.width(context);
    var height = AppConfig.height(context);
    final isDark = context.read<ThemeCubit>().isDark();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
      width: width * 0.2,
      height: height * 0.05,
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.primaryDarkColor
            : AppColors.containerTextFieldColor,
        borderRadius: BorderRadius.circular(9),
      ),
      child: Row(
        spacing: width * 0.05,
        children: [
          GestureDetector(onTap: chooseEn, child: widget1),
          GestureDetector(onTap: chooseAr, child: widget2),
        ],
      ),
    );
  }
}
