import 'package:eco_swap_app/core/utils/app_assets.dart';
import 'package:eco_swap_app/core/utils/app_colors.dart';
import 'package:eco_swap_app/core/utils/app_route.dart';
import 'package:eco_swap_app/core/utils/validation.dart';
import 'package:eco_swap_app/features/auth/widget/custom_divider_widget.dart';
import 'package:eco_swap_app/features/auth/widget/custom_end_section_widget.dart';
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

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passController = TextEditingController();
  var rePassController = TextEditingController();


  bool obscureText = true;
  bool obscureReText = true;

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
                        CustomHeaderWidget(text1: language.create_your_account,
                            text2: language.join_your_local_sharing_community),
                        SizedBox(height: height * 0.01),
                        CustomTextWidget(text: language.full_name),
                        CustomTextFormFeild(
                          controller: nameController,
                          onValidator: (text) {
                            return Validation.validateFullName(text);
                          },
                          hintText: language.enter_your_name,
                          prefixIcon: Icon(Icons.person_outline),
                        ),
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
                        CustomTextWidget(text: language.phone_number),
                        CustomTextFormFeild(
                          controller: phoneController,
                          onValidator: (text) {
                            return Validation.validateMobileNum(text);
                          },
                          textInputType: TextInputType.phone,
                          hintText: language.enter_your_phone,
                          prefixIcon: Icon(Icons.phone_outlined),
                        ),
                        SizedBox(height: height * 0.01),
                        CustomTextWidget(text: language.password),
                        CustomTextFormFeild(
                          controller: passController,
                          onValidator: (text) {
                            return Validation.validatePassword(text);
                          },
                          obscureText: obscureText,
                          hintText: language.enter_your_password,
                          prefixIcon: Icon(Icons.lock_outline),
                          sufixIcon: IconButton(
                            onPressed: () {
                              obscureText = !obscureText;
                              setState(() {

                              });
                            },
                            icon: Icon(obscureText
                                ? Icons.visibility_off_outlined
                                : Icons.remove_red_eye_outlined),
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        CustomTextWidget(text: language.confirm_password),
                        CustomTextFormFeild(
                          controller: rePassController,
                          onValidator: (text) {
                            return Validation.rePasswordValidator(
                                text, passController);
                          },
                          obscureText: obscureReText,
                          hintText: language.enter_your_confirm_password,
                          prefixIcon: Icon(Icons.lock_outline),
                          sufixIcon: IconButton(
                            onPressed: () {
                              obscureReText = !obscureReText;
                              setState(() {

                              });
                            },
                            icon: Icon(obscureReText
                                ? Icons.visibility_off_outlined
                                : Icons.remove_red_eye_outlined),
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        CustomElevatedButton(
                          onClick: () {
                            //todo Navigate to home Screen
                            if (_formKry.currentState?.validate() == true) {

                            }
                          },
                          text: language.create_account,
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
                        CustomEndSectionWidget(
                            text1: language.already_have_an_account,
                            text2: language.sign_in,
                            onClick: () {
                              //todo Navigate to login screen
                              Navigator.of(context).pushNamed(AppRoute.login);
                            }),
                        SizedBox(height: height * 0.02),
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
