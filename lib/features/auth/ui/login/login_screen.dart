import 'package:eco_swap_app/core/di/di.dart';
import 'package:eco_swap_app/core/utils/app_assets.dart';
import 'package:eco_swap_app/core/utils/app_colors.dart';
import 'package:eco_swap_app/core/utils/app_route.dart';
import 'package:eco_swap_app/core/utils/utils_dialog.dart';
import 'package:eco_swap_app/core/utils/validation.dart';
import 'package:eco_swap_app/features/auth/ui/common/cubit/login_with_google_cubit.dart';
import 'package:eco_swap_app/features/auth/ui/common/cubit/login_with_google_states.dart';
import 'package:eco_swap_app/features/auth/ui/login/cubit/login_cubit.dart';
import 'package:eco_swap_app/features/auth/ui/login/cubit/login_states.dart';
import 'package:eco_swap_app/features/auth/ui/widget/custom_divider_widget.dart';
import 'package:eco_swap_app/features/auth/ui/widget/custom_end_section_widget.dart';
import 'package:eco_swap_app/features/auth/ui/widget/custom_forget_pass_widget.dart';
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

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var passController = TextEditingController(text: "123QWE1@#sdff");

  var emailController = TextEditingController(text: "mariam@gmail.com");

  bool obsureText = true;
  final _formKry = GlobalKey<FormState>();
  LoginCubit loginCubit = getIt();
  LoginWithGoogleCubit loginWithGoogleCubit = getIt();

  @override
  Widget build(BuildContext context) {
    UtilsDialog.context = context;
    UtilsDialog utilsDialog = UtilsDialog();
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
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
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
                                    text2: language
                                        .sign_in_to_continue_sharing),
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
                                BlocListener<LoginCubit, LoginStates>(
                                  bloc: loginCubit,
                                  listener: (context, state) {
                                    if (state.loginStates.isLoading) {
                                      utilsDialog.showLoading(
                                        context: context,
                                        content: language.loading,
                                      );
                                    } else if (state.loginStates.isError) {
                                      utilsDialog.hideDialog(context: context);
                                      utilsDialog.showMessage(
                                        context: context,
                                        content:
                                        state.loginStates.errorMessage ?? "",
                                        title: language.error,
                                        posAction: language.ok,

                                      );
                                    } else if (state.loginStates.isSuccess) {
                                      utilsDialog.hideDialog(context: context);
                                      utilsDialog.showMessage(
                                        context: context,
                                        content: language.login_successfully,
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
                                      //todo Navigate to home Screen
                                      if (_formKry.currentState?.validate() ==
                                          true) {
                                        loginCubit.login(
                                            emailController.text,
                                            passController.text);
                                      }
                                    },
                                    text: language.sign_in,
                                  ),
                                ),
                                CustomDividerWidget(),
                                SizedBox(height: height * 0.002),
                                BlocListener<LoginWithGoogleCubit,
                                    LoginWithGoogleStates>(
                                  bloc: loginWithGoogleCubit,
                                  listener: (context, state) {
                                    if (state.loginWithGoogleStates.isLoading) {
                                      utilsDialog.showLoading(
                                        context: context,
                                        content: language.loading,
                                      );
                                    } else
                                    if (state.loginWithGoogleStates.isError) {
                                      utilsDialog.hideDialog(context: context);
                                      utilsDialog.showMessage(
                                        context: context,
                                        content:
                                        state.loginWithGoogleStates
                                            .errorMessage ?? "",
                                        title: language.error,
                                        posAction: language.ok,

                                      );
                                    } else
                                    if (state.loginWithGoogleStates.isSuccess) {
                                      utilsDialog.hideDialog(context: context);
                                      utilsDialog.showMessage(
                                        context: context,
                                        content: language.login_successfully,
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
                                      loginWithGoogleCubit.loginWithGoogle();
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
                                    text1: language.new_to_ecoSwap,
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
