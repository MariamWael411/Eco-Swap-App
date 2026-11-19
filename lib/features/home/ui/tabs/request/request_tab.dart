import 'package:eco_swap_app/core/utils/app_colors.dart';
import 'package:eco_swap_app/features/home/ui/tabs/request/widgets/custom_received_widget.dart';
import 'package:eco_swap_app/features/home/ui/tabs/request/widgets/custom_sent_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_config.dart';
import '../../../../../cubit/theme_cubit.dart';
import '../../../../../l10n/app_localizations.dart';

class RequestTab extends StatelessWidget {
  const RequestTab({super.key});

  @override
  Widget build(BuildContext context) {
    var width = AppConfig.width(context);
    var height = AppConfig.height(context);
    final isDark = context.read<ThemeCubit>().isDark();
    var theme = Theme.of(context);
    var language = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.03,
          vertical: height * 0.03
      ),
      child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: height * 0.01,
                    horizontal: width * 0.013
                ),
                decoration: BoxDecoration(
                    color: theme.colorScheme.onSecondary,
                    borderRadius: BorderRadius.circular(13)
                ),
                child: TabBar(

                  unselectedLabelStyle: theme.textTheme.bodyMedium,
                  labelStyle: theme.textTheme.headlineLarge,

                  labelPadding: EdgeInsets.only(
                      top: height * 0.01
                  ),
                  indicator: BoxDecoration(
                      color: isDark ? AppColors.green2Color : AppColors
                          .whiteColor,
                      borderRadius: BorderRadius.circular(12)
                  ),
                  indicatorWeight: height * 0.016,
                  dividerColor: AppColors.transparentColor,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    Text(language.received),
                    Text(language.sent),


                  ],),
              ),
              SizedBox(height: height * 0.02,),
              Expanded(
                child: TabBarView(children: [
                  CustomReceivedWidget(),
                  CustomSentWidget()
                ]),
              )
            ],
          )),
    );
  }
}
