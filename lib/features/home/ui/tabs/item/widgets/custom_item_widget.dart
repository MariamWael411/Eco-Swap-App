import 'package:cached_network_image/cached_network_image.dart';
import 'package:eco_swap_app/core/di/di.dart';
import 'package:eco_swap_app/core/utils/app_assets.dart';
import 'package:eco_swap_app/core/utils/app_route.dart';
import 'package:eco_swap_app/core/utils/app_styles.dart';
import 'package:eco_swap_app/features/add_item/ui/cubit/item_cubit.dart';
import 'package:eco_swap_app/features/add_item/ui/cubit/item_states.dart';
import 'package:eco_swap_app/features/home/ui/tabs/home/model/category.dart';
import 'package:eco_swap_app/features/network/model/app_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_config.dart';
import '../../../../../../core/utils/utils_toast.dart';
import '../../../../../../cubit/theme_cubit.dart';
import '../../../../../../l10n/app_localizations.dart';
import '../../../../../add_item/domain/entity/item.dart';
import '../../../../../common/widgets/custom_elevated_button.dart';

class CustomItemWidget extends StatefulWidget {
  Item item;

  CustomItemWidget({super.key, required this.item});

  @override
  State<CustomItemWidget> createState() => _CustomItemWidgetState();
}

class _CustomItemWidgetState extends State<CustomItemWidget> {
  var cubit = getIt<ItemCubit>();

  @override
  Widget build(BuildContext context) {
    Category category = Category();
    category.context = context;
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
    String text = AppModel.itemStatus(context)[widget.item.statusIndex];
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: height * 0.02,
        horizontal: width * 0.03,
      ),
      margin: EdgeInsets.symmetric(vertical: height * 0.01),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
        color: theme.colorScheme.onPrimaryFixedVariant,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: theme.colorScheme.onPrimary),
      ),
      child: Row(
        spacing: width * 0.02,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(13),
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              height: height * 0.16,
              width: width * 0.3,
              imageUrl: widget.item.imageUrl,
              placeholder: (context, url) =>
                  Center(
                    child: CircularProgressIndicator(
                        color: AppColors.greenColor),
                  ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.024,
                        vertical: height * 0.007,
                      ),
                      decoration: BoxDecoration(
                        color: text == language.available
                            ? theme.colorScheme.onInverseSurface
                            : theme.colorScheme.onTertiary,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Text(
                        text,
                        style: text == language.available
                            ? theme.textTheme.bodySmall
                            : (isDark
                            ? AppStyles.extra8Bink
                            : AppStyles.extra8Red),
                      ),
                    ),
                    Text(
                      "3 ${language.requests}",
                      style: theme.textTheme.labelMedium,
                    ),
                  ],
                ),
                SizedBox(height: height * 0.01),

                Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    spacing: height * 0.01,
                    children: [
                      Text(widget.item.title,
                        style: theme.textTheme.displaySmall,),
                      Text(
                        "${category.catogeries()[widget.item.categoryIndex + 1]
                            .name} · ${conditions[widget.item.conditionIndex]}",
                        style: theme.textTheme.displayMedium,)
                    ]
                )
                ,


                SizedBox(height: height * 0.032),
                Row(
                  spacing: width * 0.03,
                  children: [
                    Expanded(
                      child: CustomElevatedButton(
                        onClick: () {
                          Navigator.of(context).pushNamed(
                              AppRoute.editItem, arguments: widget.item);
                        },
                        backgroundColor: isDark
                            ? AppColors.containerColor
                            : AppColors.whiteColor,
                        borderColor: theme.colorScheme.onPrimary,
                        item: Row(
                          spacing: width * 0.02,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppAssets.editSvg,
                              colorFilter: ColorFilter.mode(
                                !isDark
                                    ? AppColors.blackColor
                                    : AppColors.textDarkColor,
                                BlendMode.srcIn,
                              ),
                            ),
                            Text(
                              language.edit,
                              style: theme.textTheme.headlineMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                    BlocListener<ItemCubit, ItemStates>(
                      bloc: cubit,
                      listenWhen: (previous, current) {
                        return true;
                      },
                      listener: (context, state) async {
                        UtilsToast.toastSuccess(language.success,
                            language.item_deleted_successfully, context);
                      },
                      child: InkWell(
                        onTap: () {
                          //todo delete item
                          cubit.deleteItem(widget.item);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.024,
                            vertical: height * 0.007,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: isDark
                                  ? AppColors.dotColor
                                  : AppColors.transparentColor,
                            ),
                            color: isDark
                                ? AppColors.transparentColor
                                : AppColors.bageColor,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: SvgPicture.asset(
                            AppAssets.delete,
                            colorFilter: ColorFilter.mode(
                              theme.colorScheme.onSecondaryFixedVariant,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]
        ,
      )
      ,
    );
  }
}
