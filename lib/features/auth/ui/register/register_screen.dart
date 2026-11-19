import 'package:eco_swap_app/core/di/di.dart';
import 'package:eco_swap_app/core/utils/app_assets.dart';
import 'package:eco_swap_app/core/utils/app_colors.dart';
import 'package:eco_swap_app/core/utils/app_route.dart';
import 'package:eco_swap_app/core/utils/utils_dialog.dart';
import 'package:eco_swap_app/core/utils/validation.dart';
import 'package:eco_swap_app/features/auth/ui/common/cubit/login_with_google_cubit.dart';
import 'package:eco_swap_app/features/auth/ui/common/cubit/login_with_google_states.dart';
import 'package:eco_swap_app/features/auth/ui/register/cubit/register_cubit.dart';
import 'package:eco_swap_app/features/auth/ui/register/cubit/register_states.dart';
import 'package:eco_swap_app/features/auth/ui/widget/custom_divider_widget.dart';
import 'package:eco_swap_app/features/auth/ui/widget/custom_end_section_widget.dart';
import 'package:eco_swap_app/features/auth/ui/widget/custom_header_widget.dart';
import 'package:eco_swap_app/features/auth/ui/widget/custom_text_widget.dart';
import 'package:eco_swap_app/features/auth/ui/widget/top_container.dart';
import 'package:eco_swap_app/features/common/widgets/custom_elevated_button.dart';
import 'package:eco_swap_app/features/common/widgets/custom_text_form_feild.dart';
import 'package:eco_swap_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_config.dart';
import '../../../../cubit/theme_cubit.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var nameController = TextEditingController(text: "mariam");
  var emailController = TextEditingController(text: "mariam@gmail.com");
  var phoneController = TextEditingController(text: "01096031628");
  var passController = TextEditingController(text: "123QWE1@#sdff");
  var rePassController = TextEditingController(text: "123QWE1@#sdff");

  bool obscureText = true;
  bool obscureReText = true;

  final _formKry = GlobalKey<FormState>();
  RegisterCubit cubit = getIt();
  LoginWithGoogleCubit loginCubit = getIt();

  @override
  Widget build(BuildContext context) {
    UtilsDialog.context = context;
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: constraints.maxHeight
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    Expanded(flex: 1, child: TopContainer()),
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
                                CustomHeaderWidget(
                                  text1: language.create_your_account,
                                  text2: language
                                      .join_your_local_sharing_community,
                                ),
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
                                      setState(() {});
                                    },
                                    icon: Icon(
                                      obscureText
                                          ? Icons.visibility_off_outlined
                                          : Icons.remove_red_eye_outlined,
                                    ),
                                  ),
                                ),
                                SizedBox(height: height * 0.01),
                                CustomTextWidget(
                                    text: language.confirm_password),
                                CustomTextFormFeild(
                                  controller: rePassController,
                                  onValidator: (text) {
                                    return Validation.rePasswordValidator(
                                      text,
                                      passController,
                                    );
                                  },
                                  obscureText: obscureReText,
                                  hintText: language
                                      .enter_your_confirm_password,
                                  prefixIcon: Icon(Icons.lock_outline),
                                  sufixIcon: IconButton(
                                    onPressed: () {
                                      obscureReText = !obscureReText;
                                      setState(() {});
                                    },
                                    icon: Icon(
                                      obscureReText
                                          ? Icons.visibility_off_outlined
                                          : Icons.remove_red_eye_outlined,
                                    ),
                                  ),
                                ),
                                SizedBox(height: height * 0.01),
                                BlocListener<RegisterCubit, RegisterStates>(
                                  bloc: cubit,
                                  listener: (context, state) {
                                    if (state.registerStates.isLoading) {
                                      UtilsDialog.showLoading(
                                        context: context,
                                        content: language.loading,
                                      );
                                    } else if (state.registerStates.isError) {
                                      UtilsDialog.hideDialog(context: context);
                                      UtilsDialog.showMessage(
                                        context: context,
                                        content:
                                        state.registerStates.errorMessage ?? "",
                                        title: language.error,
                                        posAction: language.ok,

                                      );
                                    } else if (state.registerStates.isSuccess) {
                                      UtilsDialog.hideDialog(context: context);
                                      UtilsDialog.showMessage(
                                        context: context,
                                        content: language.register_successfully,
                                        title: language.success,
                                        posAction: language.ok,
                                        posActions: () {
                                          Navigator.pushReplacementNamed(
                                            context,
                                            AppRoute.home,
                                          );
                                        },
                                      );
                                    }
                                  },
                                  child: CustomElevatedButton(
                                    onClick: () async {
                                      //todo Navigate to home Screen
                                      if (_formKry.currentState?.validate() ==
                                          true) {
                                        cubit.register(
                                            emailController.text,
                                            passController.text,
                                            nameController.text,
                                            phoneController.text);
                                      }
                                    },
                                    text: language.create_account,
                                  ),
                                ),
                                CustomDividerWidget(),
                                SizedBox(height: height * 0.002),
                                BlocListener<LoginWithGoogleCubit,
                                    LoginWithGoogleStates>(
                                  bloc: loginCubit,
                                  listener: (context, state) {
                                    if (state.loginWithGoogleStates.isLoading) {
                                      UtilsDialog.showLoading(
                                        context: context,
                                        content: language.loading,
                                      );
                                    } else
                                    if (state.loginWithGoogleStates.isError) {
                                      UtilsDialog.hideDialog(context: context);
                                      UtilsDialog.showMessage(
                                        context: context,
                                        content:
                                        state.loginWithGoogleStates
                                            .errorMessage ?? "",
                                        title: language.error,
                                        posAction: language.ok,

                                      );
                                    } else
                                    if (state.loginWithGoogleStates.isSuccess) {
                                      UtilsDialog.hideDialog(context: context);
                                      UtilsDialog.showMessage(
                                        context: context,
                                        content: language.register_successfully,
                                        title: language.success,
                                        posAction: language.ok,
                                        posActions: () {
                                          Navigator.pushReplacementNamed(
                                            context,
                                            AppRoute.home,
                                          );
                                        },
                                      );
                                    }
                                  },
                                  child: CustomElevatedButton(
                                    onClick: () {
                                      loginCubit.loginWithGoogle();
                                    },
                                    backgroundColor: isDark
                                        ? AppColors.primaryDarkColor
                                        : AppColors.whiteColor,
                                    borderColor: theme.colorScheme.onPrimary,
                                    item: Row(
                                      spacing: width * 0.02,
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
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
                                ),
                                CustomEndSectionWidget(
                                  text1: language.already_have_an_account,
                                  text2: language.sign_in,
                                  onClick: () {
                                    //todo Navigate to login screen
                                    Navigator.of(context).pushNamed(
                                        AppRoute.login);
                                  },
                                ),
                                SizedBox(height: height * 0.02),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
