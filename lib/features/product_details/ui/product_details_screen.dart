import 'package:eco_swap_app/features/common/widgets/custom_elevated_button.dart';
import 'package:eco_swap_app/features/home/ui/tabs/home/model/category.dart';
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
import '../../add_item/domain/entity/item.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({super.key});

  late Item args;
  @override
  Widget build(BuildContext context) {
    Category category = Category();
    category.context = context;
    args = ModalRoute.of(context)?.settings.arguments as Item;

    var width = AppConfig.width(context);

    var height = AppConfig.height(context);
    final isDark = context.read<ThemeCubit>().isDark();
    var theme = Theme.of(context);
    var language = AppLocalizations.of(context)!;
    List<String> conditions = [
      language.like_new,
      language.good,
      language.well_used,
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomStackWidget(
              imageUrl: args.imageUrl,
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
                  CustomCatogeryWidget(
                    category:
                        category.catogeries()[args.categoryIndex + 1].name ??
                        "",
                    status: args.status,
                  ),
                  SizedBox(height: height * 0.01),
                  Text(args.title, style: theme.textTheme.bodyLarge),
                  Text(
                    "${conditions[args.conditionIndex]} • Added 2 days ago",
                    style: theme.textTheme.displayMedium,
                  ),
                  SizedBox(height: height * 0.01),
                  Divider(color: theme.colorScheme.onPrimary),
                  Text(
                    language.about_this_item,
                    style: theme.textTheme.bodyLarge?.copyWith(fontSize: 14),
                  ),
                  Text(
                    args.description,
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
