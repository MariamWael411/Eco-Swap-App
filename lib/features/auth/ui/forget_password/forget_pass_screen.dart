import 'package:eco_swap_app/core/utils/app_colors.dart';
import 'package:eco_swap_app/core/utils/app_route.dart';
import 'package:eco_swap_app/core/utils/utils_dialog.dart';
import 'package:eco_swap_app/features/auth/ui/forget_password/cubit/forget_pass_cubit.dart';
import 'package:eco_swap_app/features/auth/ui/forget_password/cubit/forget_pass_states.dart';
import 'package:eco_swap_app/features/auth/ui/widget/custom_header_widget.dart';
import 'package:eco_swap_app/features/auth/ui/widget/custom_text_widget.dart';
import 'package:eco_swap_app/features/auth/ui/widget/top_container.dart';
import 'package:eco_swap_app/features/common/widgets/custom_elevated_button.dart';
import 'package:eco_swap_app/features/common/widgets/custom_text_form_feild.dart';
import 'package:eco_swap_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../../../../core/utils/app_config.dart';
import '../../../../core/utils/validation.dart';
import '../../../../cubit/theme_cubit.dart';

class ForgetPassScreen extends StatefulWidget {
  const ForgetPassScreen({super.key});

  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  var emailController = TextEditingController(text: "mariam@gmail.com");
  final _formKry = GlobalKey<FormState>();
  ForgetPassCubit cubit = getIt();
  @override
  Widget build(BuildContext context) {
    Validation.context = context;
    UtilsDialog.context = context;
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
                                CustomHeaderWidget(
                                    text1: language.reset_your_password,
                                    text2: language
                                        .we_will_send_a_secure_reset_link_to_your_inbox),
                                SizedBox(height: height * 0.01),
                                BlocConsumer<ForgetPassCubit, ForgetPassStates>(
                                  bloc: cubit,
                                  builder: (BuildContext context, state) {
                                    if (state.forgetPassStates.isSuccess) {
                                      UtilsDialog.hideDialog(context: context);

                                      return Column(
                                        spacing: height * 0.023,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: width * 0.04,
                                                vertical: height * 0.02
                                            ),
                                            decoration: BoxDecoration(
                                              color: theme.colorScheme
                                                  .onInverseSurface,
                                              borderRadius: BorderRadius
                                                  .circular(11),
                                            ),
                                            child: Icon(Icons.check_rounded,
                                              color: theme.colorScheme
                                                  .primary,),
                                          ),
                                          Text(language.check_your_email,
                                            style: theme.textTheme.headlineSmall
                                                ?.copyWith(fontSize: 16),),
                                          Text(language
                                              .we_sent_a_password_reset_link_to_your,
                                            style: theme.textTheme
                                                .displayMedium,
                                            textAlign: TextAlign.center,),
                                          CustomElevatedButton(
                                            onClick: () {
                                              Navigator.of(context).pop();
                                            },
                                            backgroundColor: isDark
                                                ? AppColors.primaryDarkColor
                                                : AppColors.whiteColor,
                                            borderColor: theme.colorScheme
                                                .onPrimary,
                                            item: Row(
                                              spacing: width * 0.02,
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,
                                              children: [
                                                Icon(Icons.arrow_back_ios,
                                                  color: isDark
                                                      ? AppColors.textDarkColor
                                                      : AppColors.blackColor,),
                                                Text(
                                                  language.back_to_login,
                                                  style: theme.textTheme
                                                      .headlineMedium,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      );
                                    }
                                    else {
                                      return Column(
                                        spacing: height * 0.015,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .stretch,
                                        children: [
                                          CustomTextWidget(
                                              text: language.email_address),
                                          CustomTextFormFeild(
                                            controller: emailController,
                                            onValidator: (text) {
                                              return Validation.validateEmail(
                                                  text);
                                            },
                                            textInputType: TextInputType
                                                .emailAddress,
                                            hintText: language.enter_your_email,
                                            prefixIcon: Icon(
                                                Icons.email_outlined),
                                          ),
                                          SizedBox(height: height * 0.01),

                                          CustomElevatedButton(
                                            onClick: () {
                                              //todo reset pass
                                              if (_formKry.currentState
                                                  ?.validate() == true) {
                                                cubit.forgetPass(
                                                    emailController.text);
                                              }
                                            },
                                            text: language.send_reset_link,
                                          ),

                                          InkWell(
                                            onTap: () {
                                              //todo navigate to login
                                              Navigator.of(context).pushNamed(
                                                  AppRoute.login);
                                            },
                                            child: Row(
                                              spacing: width * 0.01,
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,
                                              children: [
                                                Icon(
                                                  Icons.arrow_back_ios_new,
                                                  color: theme.colorScheme
                                                      .primary,
                                                  size: 20,
                                                ),
                                                Text(
                                                  language.back_to_login,
                                                  style: theme.textTheme
                                                      .headlineLarge,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    }
                                  },
                                  listener: (BuildContext context, state) {
                                    if (state.forgetPassStates.isLoading) {
                                      UtilsDialog.showLoading(
                                        context: context,
                                        content: language.loading,
                                      );
                                    } else if (state.forgetPassStates.isError) {
                                      UtilsDialog.hideDialog(context: context);
                                      UtilsDialog.showMessage(
                                        context: context,
                                        content:
                                        state.forgetPassStates.errorMessage ??
                                            "",
                                        title: language.error,
                                        posAction: language.ok,

                                      );
                                    }
                                  },

                                ),

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
