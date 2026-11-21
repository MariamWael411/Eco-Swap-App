import 'package:eco_swap_app/core/di/di.dart';
import 'package:eco_swap_app/cubit/my_user_cubit.dart';
import 'package:eco_swap_app/features/add_item/ui/cubit/item_cubit.dart';
import 'package:eco_swap_app/features/add_item/ui/cubit/item_states.dart';
import 'package:eco_swap_app/features/home/ui/tabs/item/widgets/custom_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_config.dart';
import '../../../../../cubit/theme_cubit.dart';
import '../../../../../l10n/app_localizations.dart';

class ItemTab extends StatefulWidget {
  const ItemTab({super.key});

  @override
  State<ItemTab> createState() => _ItemTabState();
}

class _ItemTabState extends State<ItemTab> {
  var cubit = getIt<ItemCubit>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit.getItem();
  }
  @override
  Widget build(BuildContext context) {
    var user = context
        .watch<MyUserCubit>()
        .state;
    var width = AppConfig.width(context);
    var height = AppConfig.height(context);
    final isDark = context.read<ThemeCubit>().isDark();
    var theme = Theme.of(context);
    var language = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.03,
          vertical: height * 0.02
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          Text(language.your_shared_items,
            style: theme.textTheme.headlineSmall?.copyWith(fontSize: 20),),
          SizedBox(height: height * 0.01,),

          SizedBox(height: height * 0.01),
          BlocBuilder<ItemCubit, ItemStates>(
            bloc: cubit,
            builder: (context, state) {
              if (state.itemStates.isLoading) {
                return Center(child: CircularProgressIndicator(),);
              }
              else if (state.itemStates.isSuccess) {
                var data = state.itemStates.data!;
                final myItems = data
                    .where((item) => item.userId == user.id)
                    .toList();
                final available = myItems
                    .where((item) => item.status == language.available)
                    .length;
                return myItems.isEmpty
                    ? Expanded(child: Center(child: Text(
                  "No Item Added Yet", style: theme.textTheme.headlineSmall,),))
                    : Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                    Text("${myItems.length} ${language
                        .listings} . $available ${language.available2}",
                      style: theme.textTheme.displayMedium,),
                    SizedBox(height: height * 0.01,),
                    Expanded(
                      child: ListView.builder(
                        itemCount: myItems.length,
                        itemBuilder: (context, index) {
                          return CustomItemWidget(item: myItems[index],);
                        },
                      ),
                    ),
                  ],
                  ),
                );
              } else {
                return Center(child: Text(state.itemStates.errorMessage!,
                  style: TextStyle(fontSize: 30),),);
              }
            },
          )
        ],
      ),
    );
  }
}
