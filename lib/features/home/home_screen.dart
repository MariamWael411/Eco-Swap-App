import 'package:eco_swap_app/core/utils/app_assets.dart';
import 'package:eco_swap_app/features/home/tabs/home/home_tab.dart';
import 'package:eco_swap_app/features/home/tabs/item/item_tab.dart';
import 'package:eco_swap_app/features/home/tabs/profile/profile_tab.dart';
import 'package:eco_swap_app/features/home/tabs/request/request_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/app_config.dart';
import '../../cubit/theme_cubit.dart';
import '../../l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Widget> tabs=[
    HomeTab(),
    ItemTab(),
    RequestTab(),
    ProfileTab()
  ];
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    var width = AppConfig.width(context);
    var height = AppConfig.height(context);
    List<String> titles = [
      AppLocalizations.of(context)!.item,
      AppLocalizations.of(context)!.request,
      AppLocalizations.of(context)!.profile,
    ];
    final isDark = context.read<ThemeCubit>().isDark();
    return Scaffold(
      appBar: selectedIndex != 0 ? AppBar(
        shape: Border(
            bottom: BorderSide(
                width: 1,
                color: Theme
                    .of(context)
                    .colorScheme
                    .onPrimaryContainer
            )
        ),

        actionsPadding: EdgeInsetsDirectional.only(
            end: width * 0.05
        ),
        actions: [
          Visibility(
            visible: selectedIndex == 1,
            child: IconButton(onPressed: () {
              //todo add Item
            },
                style: IconButton.styleFrom(
                    backgroundColor: Theme
                        .of(context)
                        .colorScheme
                        .inversePrimary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                        side: BorderSide(
                            width: 1,
                            color: Theme
                                .of(context)
                                .colorScheme
                                .onSecondary
                        )
                    )
                ),
                icon: Icon(
                  Icons.add,
                  color: Theme
                      .of(context)
                      .colorScheme
                      .onSecondaryContainer,
                )
            ),
          )
        ],
        leading: Image.asset(isDark ? AppAssets.logoDark : AppAssets.logoLight),
        title: Text(titles[selectedIndex - 1], style: Theme
            .of(context)
            .textTheme
            .titleMedium,),
        centerTitle: true,
      ) : null,
      body: tabs[selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Theme.of(context).colorScheme.onPrimaryContainer
            )
          )
        ),
        child: BottomNavigationBar(
          type:  BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;

            setState(() {});
          },
          items: [
            bottomNavigationBarItem(
              Icon(Icons.home_outlined,size: 30,),
              AppLocalizations.of(context)!.home,

              0,
            ),
            bottomNavigationBarItem(
              Icon(Icons.view_in_ar_outlined,size: 30,),
              AppLocalizations.of(context)!.item,

              1,
            ),
            bottomNavigationBarItem(
              Icon(Icons.assignment_turned_in_outlined,size: 30,),
              AppLocalizations.of(context)!.request,

              2,
            ),
            bottomNavigationBarItem(
              Icon(Icons.person_outline_rounded,size: 30,),
              AppLocalizations.of(context)!.profile,

              3,
            ),
          ],
        ),
      ),
    );
  }
}


BottomNavigationBarItem bottomNavigationBarItem(
    Icon icon,
    String label,
    int index,
    ) {
  return BottomNavigationBarItem(
    icon: icon,
    label: label,
    activeIcon: icon,
  );
}
