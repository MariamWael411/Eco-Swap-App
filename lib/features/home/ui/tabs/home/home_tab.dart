import 'package:eco_swap_app/core/utils/app_route.dart';
import 'package:eco_swap_app/features/common/widgets/custom_text_form_feild.dart';
import 'package:eco_swap_app/features/home/ui/tabs/home/widgets/custom_grid_view_item.dart';
import 'package:eco_swap_app/features/home/ui/tabs/home/widgets/custom_home_container_widget.dart';
import 'package:eco_swap_app/features/home/ui/tabs/home/widgets/custom_home_top_section_widget.dart';
import 'package:eco_swap_app/features/home/ui/tabs/home/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_config.dart';
import '../../../../../cubit/theme_cubit.dart';
import '../../../../../l10n/app_localizations.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var width = AppConfig.width(context);
    var height = AppConfig.height(context);
    final isDark = context.read<ThemeCubit>().isDark();

    var theme = Theme.of(context);
    var language = AppLocalizations.of(context)!;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: height * 0.024,
        ),
        child: Column(
          spacing: height * 0.01,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomHomeTopSectionWidget(),
            SizedBox(height: height * 0.023),
            CustomHomeContainerWidget(),
            SizedBox(height: height * 0.01),
            CustomTextFormFeild(
              hintText: language.search_available_items,
              prefixIcon: Icon(Icons.search),
            ),
            SizedBox(height: height * 0.01),
            SizedBox(
              height: height * 0.041,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      currentIndex = index;
                      setState(() {});
                    },
                    child: CustomListViewItem(
                      index: index,
                      isActive: currentIndex == index,
                    ),
                  );
                },
                itemCount: 5,
              ),
            ),
            SizedBox(height: height * 0.006),
            Text(
              language.fresh_finds_near_you,
              style: theme.textTheme.headlineMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  language.items_available_today,
                  style: theme.textTheme.displayMedium,
                ),
                Text(language.see_all, style: theme.textTheme.headlineLarge),
              ],
            ),
            SizedBox(height: height * 0.01),
            Expanded(
              child: GridView.builder(
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 17 / 20,
                  crossAxisSpacing: width * 0.02,
                  mainAxisSpacing: height * 0.02,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            AppRoute.productDetails);
                      },
                      child: CustomGridViewItem());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
