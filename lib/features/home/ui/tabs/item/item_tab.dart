import 'package:eco_swap_app/features/home/ui/tabs/item/widgets/custom_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_config.dart';
import '../../../../../cubit/theme_cubit.dart';
import '../../../../../l10n/app_localizations.dart';

class ItemTab extends StatelessWidget {
  const ItemTab({super.key});

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
          vertical: height * 0.02
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          Text(language.your_shared_items,
            style: theme.textTheme.headlineSmall?.copyWith(fontSize: 20),),
          SizedBox(height: height * 0.01,),
          Text("3 ${language.listings} . 2 ${language.available2}",
            style: theme.textTheme.displayMedium,),
          SizedBox(height: height * 0.01),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return CustomItemWidget();
              },
            ),
          )
        ],
      ),
    );
  }
}
