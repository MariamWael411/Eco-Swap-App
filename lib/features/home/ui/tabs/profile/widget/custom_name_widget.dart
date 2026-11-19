import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_config.dart';
import '../../../../../../core/utils/app_styles.dart';

class CustomNameWidget extends StatelessWidget {
  const CustomNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var width = AppConfig.width(context);
    var height = AppConfig.height(context);
    return ClipOval(
      child: Container(
        alignment: Alignment.center,
        width: 0.2 * width,
        height: height * 0.092,

        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.linearColor, AppColors.linear2Color],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Text("MN", style: AppStyles.extra20Green),
      ),
    );
  }
}
