import 'package:eco_swap_app/core/di/di.dart';
import 'package:eco_swap_app/core/utils/app_route.dart';
import 'package:eco_swap_app/cubit/my_user_cubit.dart';
import 'package:eco_swap_app/features/add_item/ui/cubit/item_cubit.dart';
import 'package:eco_swap_app/features/add_item/ui/cubit/item_states.dart';
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
  var cubit = getIt<ItemCubit>();
  var searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit.getItem();
    cubit.getUserLocation();
  }


  @override
  Widget build(BuildContext context) {
    var width = AppConfig.width(context);
    var height = AppConfig.height(context);
    final isDark = context.read<ThemeCubit>().isDark();
    var user = context
        .watch<MyUserCubit>()
        .state;

    var theme = Theme.of(context);
    var language = AppLocalizations.of(context)!;

    return SafeArea(
      child: CustomScrollView(
        slivers: [

          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.04,
              vertical: height * 0.024,
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                CustomHomeTopSectionWidget(
                  name: user.fullName,
                ),
                SizedBox(height: height * 0.03),
                CustomHomeContainerWidget(),
                SizedBox(height: height * 0.02),

                CustomTextFormFeild(
                  controller: searchController,
                  onChanged: (value) {
                    setState(() {

                    });
                  },
                  hintText: language.search_available_items,
                  prefixIcon: Icon(Icons.search),
                ),

                SizedBox(height: height * 0.02),

                SizedBox(
                  height: height * 0.041,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            currentIndex = index;

                          });
                          if (index == 0) {
                            cubit.getItem();
                          } else {
                            cubit.getFilterItem(index - 1);
                          }

                        },
                        child: CustomListViewItem(
                          index: index,
                          isActive: currentIndex == index,
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: height * 0.02),

                Text(
                  language.fresh_finds_near_you,
                  style: theme.textTheme.headlineMedium,
                ),


              ]),
            ),
          ),

          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.04,
            ),
            sliver: BlocBuilder<ItemCubit, ItemStates>(
              bloc: cubit,
              builder: (context, state) {
                if (state.itemStates.isSuccess) {

                  var data = state.itemStates.data!;
                  var search = data
                      .where((element) =>
                  element.title.contains(searchController.text) ||
                      element.description.contains(searchController.text))
                      .toList();

                  return SliverMainAxisGroup(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${data.length} items Available to day",
                              style: theme.textTheme.displayMedium,),
                            Text(
                                language.see_all,
                                style: theme.textTheme.headlineLarge),
                          ],
                        ),
                      ),
                      SliverToBoxAdapter(
                          child: SizedBox(height: height * 0.02,)),
                      (data.isEmpty)
                          ? SliverToBoxAdapter(
                        child: SizedBox(height: height * 0.3, child: Center(
                          child: Text('No Item Found',
                            style: theme.textTheme.headlineSmall,),)),)
                          : (searchController.text.isNotEmpty && search.isEmpty)
                          ? SliverToBoxAdapter(
                        child: SizedBox(height: height * 0.3, child: Center(
                          child: Text('No Result Found',
                            style: theme.textTheme.headlineSmall,),)),)
                          : SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                              (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    AppRoute.productDetails,
                                    arguments: search.isEmpty
                                        ? data[index]
                                        : search[index]
                                );
                              },
                              child: CustomGridViewItem(item: search.isEmpty
                                  ? data[index]
                                  : search[index],
                                userPosition: state.currentPosition,),
                            );
                          },
                          childCount: search.isEmpty ? data.length : search
                              .length,
                        ),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 17 / 20,
                          crossAxisSpacing: width * 0.02,
                          mainAxisSpacing: height * 0.02,
                        ),
                      ),
                    ],

                  );
                } else if (state.itemStates.isLoading) {
                  return SliverToBoxAdapter(
                      child: Center(child: CircularProgressIndicator(),));
                } else {
                  return SliverToBoxAdapter(child: Center(child: Text(
                    state.itemStates.errorMessage!,
                    style: TextStyle(fontSize: 30),),));
                }
              },

            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: height * 0.03,))
        ],
      ),
    );;
  }
}
