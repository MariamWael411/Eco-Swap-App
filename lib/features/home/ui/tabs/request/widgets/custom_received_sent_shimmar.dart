import 'package:eco_swap_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_config.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../../../../common/widgets/custom_elevated_button.dart';
import '../../profile/widget/custom_name_widget.dart';

class CustomReceivedSentShimmar extends StatelessWidget {
  const CustomReceivedSentShimmar({super.key});

  @override
  Widget build(BuildContext context) {
    var width = AppConfig.width(context);
    var height = AppConfig.height(context);
    var theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.03,
        vertical: height * 0.014,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.01,
        vertical: height * 0.01,
      ),
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
        mainAxisSize: MainAxisSize.min,
        spacing: height * 0.02,
        children: [
          // User information
          Row(
            spacing: width * 0.03,
            children: [
              CustomNameWidget(
                textStyle: AppStyles.extra20Green.copyWith(fontSize: 12),
                name: "mariam wael",
                widthCon: 0.091 * width,
                heightCon: height * 0.04,
              ),
              Expanded(
                child: Column(
                  spacing: height * 0.01,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("mariam wael", style: theme.textTheme.displaySmall),
                    Text("a time ago", style: theme.textTheme.displayMedium),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.024,
                  vertical: height * 0.007,
                ),
                decoration: BoxDecoration(
                  color: theme.colorScheme.onInverseSurface,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Text("Pending", style: theme.textTheme.bodySmall),
              ),
            ],
          ),

          // Item information
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.03,
              vertical: height * 0.013,
            ),
            decoration: BoxDecoration(
              color: theme.colorScheme.onSecondary,
              borderRadius: BorderRadius.circular(13),
            ),
            child: Row(
              spacing: width * 0.03,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(9),
                  child: Image.asset(
                    AppAssets.intro1Light,
                    fit: BoxFit.cover,
                    height: height * 0.06,
                    width: width * 0.13,
                  ),
                ),
                Expanded(
                  child: Column(
                    spacing: height * 0.01,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text("Item Name", style: theme.textTheme.labelLarge),
                      Text(
                        "Item Description",
                        style: theme.textTheme.displaySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Accept and reject buttons
          Row(
            spacing: width * 0.03,
            children: [
              Expanded(
                child: CustomElevatedButton(
                  onClick: () {},
                  backgroundColor: AppColors.whiteColor,
                  borderColor: theme.colorScheme.onPrimary,
                  item: Row(
                    spacing: width * 0.02,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.close, color: AppColors.blackColor),
                      Text("Reject", style: theme.textTheme.headlineMedium),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: CustomElevatedButton(
                  onClick: () {},
                  item: Row(
                    spacing: width * 0.02,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check, color: AppColors.whiteColor),
                      Text("Accept", style: theme.textTheme.labelSmall),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
