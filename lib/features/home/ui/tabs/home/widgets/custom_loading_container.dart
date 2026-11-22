import 'package:eco_swap_app/core/utils/app_assets.dart';
import 'package:eco_swap_app/core/utils/app_config.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_styles.dart';

class CustomLoadingContainer extends StatelessWidget {
  const CustomLoadingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    var width = AppConfig.width(context);
    var height = AppConfig.height(context);
    var theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
        color: theme.colorScheme.onPrimaryFixedVariant,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: theme.colorScheme.onPrimary),
      ),
      child: Column(
        children: [
          Stack(
            alignment: AlignmentGeometry.bottomLeft,
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.only(
                  topRight: Radius.circular(17),
                  topLeft: Radius.circular(17),
                ),
                child: Image.asset(
                  AppAssets.intro1Light,
                  fit: BoxFit.fill,
                  height: height * 0.13,
                  width: double.infinity,
                ),
              ),
              Container(
                width: width * 0.15,
                margin: EdgeInsets.only(
                  left: width * 0.02,
                  bottom: height * 0.01,
                ),
                padding: EdgeInsets.symmetric(vertical: height * 0.01),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Text("text", style: AppStyles.extra8Green),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.02,
              vertical: height * 0.01,
            ),
            child: Column(
              spacing: height * 0.01,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("text", style: theme.textTheme.displaySmall),
                Text("text", style: theme.textTheme.displayMedium),
                Row(
                  spacing: width * 0.01,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      width: 5,
                      height: 5,
                    ),
                    Text("text", style: AppStyles.semi8DarkGreen),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
