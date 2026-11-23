import 'package:eco_swap_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_config.dart';
import '../../../../../common/widgets/custom_elevated_button.dart';

class CustomShimmarItem extends StatelessWidget {
  const CustomShimmarItem({super.key});

  @override
  Widget build(BuildContext context) {
    var width = AppConfig.width(context);
    var height = AppConfig.height(context);
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: height * 0.02,
        horizontal: width * 0.03,
      ),
      margin: EdgeInsets.symmetric(vertical: height * 0.01),
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
      child: Row(
        spacing: width * 0.02,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(13),
            child: Image.asset(
              AppAssets.intro1Light,
              fit: BoxFit.fill,
              height: height * 0.16,
              width: width * 0.3,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.024,
                        vertical: height * 0.007,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.onInverseSurface,

                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Text("text", style: theme.textTheme.bodySmall),
                    ),
                    Text("dddddddddd", style: theme.textTheme.labelMedium),
                  ],
                ),
                SizedBox(height: height * 0.01),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: height * 0.01,
                  children: [
                    Text("gggggggggg", style: theme.textTheme.displaySmall),
                    Text(
                      "dddddddddd f  ggghhj",
                      style: theme.textTheme.displayMedium,
                    ),
                  ],
                ),

                SizedBox(height: height * 0.032),
                Row(
                  spacing: width * 0.03,
                  children: [
                    Expanded(
                      child: CustomElevatedButton(
                        onClick: () {},
                        backgroundColor: AppColors.containerColor,
                        borderColor: theme.colorScheme.onPrimary,
                        item: Row(
                          spacing: width * 0.02,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppAssets.editSvg,
                              colorFilter: ColorFilter.mode(
                                AppColors.textDarkColor,
                                BlendMode.srcIn,
                              ),
                            ),
                            Text("fffg", style: theme.textTheme.headlineMedium),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.024,
                          vertical: height * 0.007,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.transparentColor),
                          color: AppColors.bageColor,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: SvgPicture.asset(
                          AppAssets.delete,
                          colorFilter: ColorFilter.mode(
                            theme.colorScheme.onSecondaryFixedVariant,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
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
