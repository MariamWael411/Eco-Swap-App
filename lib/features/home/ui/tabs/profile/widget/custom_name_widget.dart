import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_config.dart';
import '../../../../../../core/utils/app_styles.dart';

class CustomNameWidget extends StatelessWidget {
  CustomNameWidget({super.key, this.heightCon, this.widthCon, this.textStyle});

  double? widthCon;
  double? heightCon;
  TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    var width = AppConfig.width(context);
    var height = AppConfig.height(context);
    return ClipOval(
      child: Container(
        alignment: Alignment.center,
        width: widthCon ?? 0.2 * width,
        height: heightCon ?? height * 0.092,

        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.linearColor, AppColors.linear2Color],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Text("MN", style: textStyle ?? AppStyles.extra20Green),
      ),
    );
  }
}
