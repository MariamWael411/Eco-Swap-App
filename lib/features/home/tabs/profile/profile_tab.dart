import 'package:eco_swap_app/core/utils/app_assets.dart';
import 'package:eco_swap_app/core/utils/app_colors.dart';
import 'package:eco_swap_app/cubit/language_cubit.dart';
import 'package:eco_swap_app/features/home/tabs/profile/widget/custom_edit_widget.dart';
import 'package:eco_swap_app/features/home/tabs/profile/widget/custom_language_widget.dart';
import 'package:eco_swap_app/features/home/tabs/profile/widget/custom_linear_container_widget.dart';
import 'package:eco_swap_app/features/home/tabs/profile/widget/custom_name_widget.dart';
import 'package:eco_swap_app/features/home/tabs/profile/widget/custom_row_widget.dart';
import 'package:eco_swap_app/features/home/tabs/profile/widget/custom_switch_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_config.dart';
import '../../../../core/utils/app_route.dart';
import '../../../../cubit/theme_cubit.dart';
import '../../../../l10n/app_localizations.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  String selectedLanguage = "en";
  @override
  Widget build(BuildContext context) {
    var width = AppConfig.width(context);
    var height = AppConfig.height(context);
    final isDark = context.read<ThemeCubit>().isDark();
    var languageCubit = context.read<LanguageCubit>();
    var themeCubit = context.read<ThemeCubit>();

    var theme = Theme.of(context);
    var language = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.043),
      child: SingleChildScrollView(
        child: Column(
          spacing: height * 0.0043,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height * 0.022,),
            CustomNameWidget(),
            Text("Mariam Nassar", style: theme.textTheme.headlineSmall,),
            Text(
              "mariam.nassar@gmail.com", style: theme.textTheme.displayMedium,),
            Row(
              spacing: width * 0.02,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.phone_outlined,
                  color: theme.colorScheme.onPrimaryContainer, size: 16,),
                Text("+20 100 234 5678", style: theme.textTheme.displayMedium,)
              ],
            ),
            SizedBox(height: height * 0.01,),
            CustomEditWidget(onTap: () {
              // todo Navigate to edit profile
            }),
            row(language, theme, language.preference),
            SizedBox(height: height * 0.01,),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  border: Border.all(
                      color: theme.colorScheme.onPrimary
                  )
              ),
              child: Column(
                children: [
                  CustomRowWidget(
                      widget: CustomLanguageWidget(
                          chooseAr: () {
                            setState(() {
                              selectedLanguage = 'ar';
                              languageCubit.changeLanguage('ar');
                            });
                          },
                          chooseEn: () {
                            setState(() {
                              selectedLanguage = 'en';
                              languageCubit.changeLanguage('en');
                            });
                          },
                          widget1: activeLanguage(
                              selectedLanguage == 'en', "EN", theme, isDark,
                              width, height),
                          widget2: activeLanguage(
                              selectedLanguage == 'ar', "ع", theme, isDark,
                              width, height)),
                      text1: language.language,
                      text2: "English / العربية",
                      icon: AppAssets.localization),
                  Divider(
                    color: theme.colorScheme.onPrimary,
                  ),
                  CustomRowWidget(
                      widget:
                      CustomSwitchWidget(changeTheme: (value) {
                        if (value) {
                          themeCubit.changeLanguage(ThemeMode.dark);
                        } else {
                          themeCubit.changeLanguage(ThemeMode.light);
                        }
                      }),
                      text1: language.appearance,
                      text2: isDark ? language.dark_mode : language.light_mode,
                      icon: isDark ? AppAssets.themeDarkIcon : AppAssets
                          .themeLightIcon),


                ],
              ),
            ),
            SizedBox(height: height * 0.01,),
            row(language, theme, language.account),
            SizedBox(height: height * 0.01,),

            Container(
              padding: EdgeInsets.symmetric(
                  vertical: height * 0.003
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  border: Border.all(
                      color: theme.colorScheme.onPrimary
                  )

              ),
              child: CustomRowWidget(
                  containerColor: theme.colorScheme.onPrimaryFixed,
                  iconColor: theme.colorScheme.onSecondaryFixedVariant,
                  widget: IconButton(onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      AppRoute.login,
                          (route) => false,
                    );
                  },
                      icon: Icon(Icons.arrow_forward_ios_outlined,
                        color: theme.colorScheme.onSecondaryContainer,)),
                  text1: language.log_out,
                  text2: language.sign_out_of_your_ecoSwap_account,
                  icon: AppAssets.logOut),
            ),
            SizedBox(height: height * 0.02,),
            CustomLinearContainerWidget()
          ],
        ),
      ),
    );
  }
}


Row row(var language, var theme, String text) {
  return Row(
    children: [
      Text(text, style: theme.textTheme.labelLarge,),
    ],
  );
}

Widget activeLanguage(bool isSelected,
    String text, var theme, var isDark, var width, var height) {
  return AnimatedContainer(

    width: isSelected ? width * 0.08 : width * 0.03,
    height: height * 0.032,
    alignment: Alignment.center,
    decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(7),
        color: isSelected ? isDark ? AppColors.darkGreen2Color : AppColors
            .whiteColor : AppColors.transparentColor
    ),
    curve: Curves.bounceInOut,
    duration: Duration(milliseconds: 500),
    child: Text(text,
        style: isSelected ? theme.textTheme.labelMedium : theme.textTheme
            .displaySmall?.copyWith(
            fontSize: 9.0,
            fontWeight: FontWeight.w400
        )),

  );
}
