import 'package:eco_swap_app/core/utils/app_colors.dart';
import 'package:eco_swap_app/core/utils/app_route.dart';
import 'package:eco_swap_app/features/auth/widget/custom_text_widget.dart';
import 'package:eco_swap_app/features/auth/widget/top_container.dart';
import 'package:eco_swap_app/features/common/widgets/custom_elevated_button.dart';
import 'package:eco_swap_app/features/common/widgets/custom_text_form_feild.dart';
import 'package:eco_swap_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_config.dart';
import '../../../cubit/theme_cubit.dart';

class ForgetPassScreen extends StatelessWidget {
  const ForgetPassScreen({super.key});

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
                        language.reset_your_password,
                        style: theme.textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        language.we_will_send_a_secure_reset_link_to_your_inbox,
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

                      CustomElevatedButton(
                        onClick: () {
                          //todo reset pass
                        },
                        text: language.send_reset_link,
                      ),
                      InkWell(
                        onTap: () {
                          //todo navigate to login
                          Navigator.of(context).pushNamed(AppRoute.login);
                        },
                        child: Row(
                          spacing: width * 0.01,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_back_ios_new,
                              color: theme.colorScheme.primary,
                              size: 20,
                            ),
                            Text(
                              language.back_to_login,
                              style: theme.textTheme.headlineLarge,
                            ),
                          ],
                        ),
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
