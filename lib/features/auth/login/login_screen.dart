import 'package:eco_swap_app/core/utils/app_assets.dart';
import 'package:eco_swap_app/core/utils/app_colors.dart';
import 'package:eco_swap_app/core/utils/app_route.dart';
import 'package:eco_swap_app/features/auth/widget/custom_divider_widget.dart';
import 'package:eco_swap_app/features/auth/widget/custom_text_widget.dart';
import 'package:eco_swap_app/features/auth/widget/top_container.dart';
import 'package:eco_swap_app/features/common/widgets/custom_elevated_button.dart';
import 'package:eco_swap_app/features/common/widgets/custom_text_form_feild.dart';
import 'package:eco_swap_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_config.dart';
import '../../../cubit/theme_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = AppConfig.width(context);
    var height = AppConfig.height(context);
    final isDark = context.read<ThemeCubit>().isDark();
    var theme = Theme.of(context);
    var language = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: isDark
          ? AppColors.primaryDarkColor
          : AppColors.greenColor,
      body: Column(
        children: [
          Expanded(flex: 2, child: TopContainer()),
          Expanded(
            flex: 5,

            child: Container(
              decoration: BoxDecoration(
                color: isDark
                    ? AppColors.transparentColor
                    : AppColors.whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(27),
                  topRight: Radius.circular(27),
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.06,
                    vertical: height * 0.03,
                  ),
                  child: Column(
                    spacing: height * 0.013,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        language.welcome_back,
                        style: theme.textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        language.sign_in_to_continue_sharing,
                        style: theme.textTheme.displayMedium,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: height * 0.01),
                      CustomTextWidget(text: language.email_address),
                      CustomTextFormFeild(
                        hintText: language.enter_your_email,
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                      SizedBox(height: height * 0.01),
                      CustomTextWidget(text: language.password),
                      CustomTextFormFeild(
                        hintText: language.enter_your_password,
                        prefixIcon: Icon(Icons.lock_outline),
                        sufixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.remove_red_eye_outlined),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              //todo Navigate to forget Pass
                              Navigator.of(context).pushNamed(
                                  AppRoute.forgetPass);
                            },
                            child: Text(
                              language.forgot_password,
                              style: theme.textTheme.headlineLarge,
                            ),
                          ),
                        ],
                      ),
                      CustomElevatedButton(
                        onClick: () {
                          //todo Navigate to home Screen
                        },
                        text: language.sign_in,
                      ),
                      CustomDividerWidget(),
                      SizedBox(height: height * 0.002),
                      CustomElevatedButton(
                        onClick: () {},
                        backgroundColor: isDark
                            ? AppColors.primaryDarkColor
                            : AppColors.whiteColor,
                        borderColor: theme.colorScheme.onPrimary,
                        item: Row(
                          spacing: width * 0.02,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppAssets.google,
                              height: height * 0.03,
                              width: width * 0.057,
                              color: isDark
                                  ? AppColors.textDarkColor
                                  : AppColors.blackColor,
                            ),
                            Text(
                              language.continue_with_google,
                              style: theme.textTheme.headlineMedium,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            language.new_to_ecoSwap,
                            style: theme.textTheme.displayMedium,
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            onPressed: () {
                              //todo Navigate to register screen
                              Navigator.of(context).pushNamed(
                                  AppRoute.register);
                            },
                            child: Text(
                              language.create_account,
                              style: theme.textTheme.headlineLarge,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
