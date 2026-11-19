import 'package:eco_swap_app/features/common/widgets/custom_elevated_button.dart';
import 'package:eco_swap_app/features/product_details/ui/widgets/custom_catogery_widget.dart';
import 'package:eco_swap_app/features/product_details/ui/widgets/custom_owner_details_widget.dart';
import 'package:eco_swap_app/features/product_details/ui/widgets/custom_product_container.dart';
import 'package:eco_swap_app/features/product_details/ui/widgets/custom_security_widget.dart';
import 'package:eco_swap_app/features/product_details/ui/widgets/custom_stack_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_config.dart';
import '../../../cubit/theme_cubit.dart';
import '../../../l10n/app_localizations.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = AppConfig.width(context);

    var height = AppConfig.height(context);
    final isDark = context.read<ThemeCubit>().isDark();
    var theme = Theme.of(context);
    var language = AppLocalizations.of(context)!;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomStackWidget(
              backClick: () {
                Navigator.of(context).pop();
              },
              favClick: () {
                //todo add to favorite
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.04,
                vertical: height * 0.02,
              ),
              child: Column(
                spacing: height * 0.01,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomCatogeryWidget(),
                  SizedBox(height: height * 0.01),
                  Text("Wireless Headphones", style: theme.textTheme.bodyLarge),
                  Text(
                    "Like new • Added 2 days ago",
                    style: theme.textTheme.displayMedium,
                  ),
                  SizedBox(height: height * 0.01),
                  Divider(color: theme.colorScheme.onPrimary),
                  Text(
                    language.about_this_item,
                    style: theme.textTheme.bodyLarge?.copyWith(fontSize: 14),
                  ),
                  Text(
                    "Comfortable wireless headphones in excellent condition. The sound is clear and the battery lasts all day. Includes the original charging cable.",
                    style: theme.textTheme.displayMedium?.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  CustomOwnerDetailsWidget(
                    onTap: () {
                      //todo show owner details
                    },
                  ),
                  CustomSecurityWidget(),
                  SizedBox(height: height * 0.01),
                  CustomProductContainer(),
                  SizedBox(height: height * 0.01),

                  CustomElevatedButton(
                    onClick: () {
                      //todo send request
                    },
                    text: language.request_this_item,
                  ),
                  SizedBox(height: height * 0.015),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
