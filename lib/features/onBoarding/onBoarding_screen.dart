import 'package:eco_swap_app/core/utils/app_assets.dart';
import 'package:eco_swap_app/core/utils/app_route.dart';
import 'package:eco_swap_app/features/common/widgets/custom_elevated_button.dart';
import 'package:eco_swap_app/features/onBoarding/model/onBoarding_model.dart';
import 'package:eco_swap_app/features/onBoarding/widgets/dot_widget.dart';
import 'package:eco_swap_app/features/onBoarding/widgets/onBoarding_item.dart';
import 'package:eco_swap_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/app_config.dart';
import '../../cubit/theme_cubit.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  var controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var width = AppConfig.width(context);
    var height = AppConfig.height(context);
    OnboardingModel.context = context;
    final isDark = context.read<ThemeCubit>().isDark();
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          isDark ? AppAssets.darkLeaveIcon : AppAssets.lightLeaveIcon,
        ),
        title: Text("EcoSwap", style: theme.textTheme.titleSmall),
        actions: [
          IconButton(
            onPressed: () {
              //todo Navigate to login
            },
            icon: Text(
              AppLocalizations.of(context)!.skip,
              style: theme.textTheme.bodyMedium,
            ),
          ),
        ],
        actionsPadding: EdgeInsetsDirectional.only(end: width * 0.05),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  currentIndex = value;
                  setState(() {});
                },
                controller: controller,
                itemBuilder: (context, index) => OnboardingItem(
                  body: OnboardingModel.bodies[index],
                  title: OnboardingModel.titles[index],
                  image: isDark
                      ? OnboardingModel.imagesDark[index]
                      : OnboardingModel.imagesLight[index],
                  index: index,
                ),
                itemCount: 3,
              ),
            ),
            Expanded(
              child: Row(
                spacing: 8,
                children: [
                  DotWidget(isActive: currentIndex == 0),
                  DotWidget(isActive: currentIndex == 1),
                  DotWidget(isActive: currentIndex == 2),
                  Spacer(),
                  CustomElevatedButton(
                    paddingHorizontal: width * 0.1,
                    onClick: () {
                      (currentIndex != 2)
                          ? controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            )
                          : Navigator.of(
                              context,
                            ).pushReplacementNamed(AppRoute.login);
                    },
                    item: (currentIndex != 2)
                        ? text(AppLocalizations.of(context)!.next, theme)
                        : Row(
                            spacing: width * 0.02,
                            children: [
                              Icon(
                                Icons.check_rounded,
                                color: theme.colorScheme.inverseSurface,
                              ),
                              text(
                                AppLocalizations.of(context)!.get_started,
                                theme,
                              ),
                            ],
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Text text(String text, var theme) {
  return Text(text, style: theme.textTheme.labelSmall);
}
