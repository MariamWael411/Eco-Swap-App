import 'package:eco_swap_app/core/utils/app_assets.dart';
import 'package:eco_swap_app/core/utils/app_colors.dart';
import 'package:eco_swap_app/core/utils/app_route.dart';
import 'package:eco_swap_app/core/utils/validation.dart';
import 'package:eco_swap_app/features/auth/widget/custom_divider_widget.dart';
import 'package:eco_swap_app/features/auth/widget/custom_end_section_widget.dart';
import 'package:eco_swap_app/features/auth/widget/custom_forget_pass_widget.dart';
import 'package:eco_swap_app/features/auth/widget/custom_header_widget.dart';
import 'package:eco_swap_app/features/auth/widget/custom_text_widget.dart';
import 'package:eco_swap_app/features/auth/widget/top_container.dart';
import 'package:eco_swap_app/features/common/widgets/custom_elevated_button.dart';
import 'package:eco_swap_app/features/common/widgets/custom_text_form_feild.dart';
import 'package:eco_swap_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_config.dart';
import '../../../cubit/theme_cubit.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var passController = TextEditingController();

  var emailController = TextEditingController();

  bool obsureText = true;
  final _formKry = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Validation.context = context;
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
                  child: Form(
                    key: _formKry,
                    child: Column(

                      spacing: height * 0.013,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomHeaderWidget(text1: language.welcome_back,
                            text2: language.sign_in_to_continue_sharing),
                        SizedBox(height: height * 0.01),
                        CustomTextWidget(text: language.email_address),
                        CustomTextFormFeild(
                          controller: emailController,
                          onValidator: (text) {
                            return Validation.validateEmail(text);
                          },
                          textInputType: TextInputType.emailAddress,
                          hintText: language.enter_your_email,
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                        SizedBox(height: height * 0.01),
                        CustomTextWidget(text: language.password),
                        CustomTextFormFeild(
                          obscureText: obsureText,
                          controller: passController,
                          onValidator: (text) {
                            return Validation.validatePassword(text);
                          },
                          hintText: language.enter_your_password,
                          prefixIcon: Icon(Icons.lock_outline),
                          sufixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                obsureText = !obsureText;
                              });

                              print(obsureText);

                            },
                            icon: Icon(obsureText
                                ? Icons.visibility_off_outlined
                                : Icons.remove_red_eye_outlined),
                          ),
                        ),
                        CustomForgetPassWidget(onClick: () {
                          //todo Navigate to forget Pass
                          Navigator.of(context).pushNamed(
                              AppRoute.forgetPass);
                        }),
                        CustomElevatedButton(
                          onClick: () {
                            //todo Navigate to home Screen
                            if (_formKry.currentState?.validate() == true) {

                            }
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
                        CustomEndSectionWidget(text1: language.new_to_ecoSwap,
                            text2: language.create_account,
                            onClick: () {
                              //todo Navigate to register screen
                              Navigator.of(context).pushNamed(
                                  AppRoute.register);
                            }),
                      ],
                    ),
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
