import 'package:cached_network_image/cached_network_image.dart';
import 'package:eco_swap_app/core/services/location_service.dart';
import 'package:eco_swap_app/core/utils/app_colors.dart';
import 'package:eco_swap_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../../../core/utils/app_config.dart';
import '../../../../../../cubit/theme_cubit.dart';
import '../../../../../../l10n/app_localizations.dart';
import '../../../../../add_item/domain/entity/item.dart';
import '../model/category.dart';

class CustomGridViewItem extends StatelessWidget {
  CustomGridViewItem(
      {super.key, required this.item, required this.userPosition});

  Item item;
  final Position? userPosition;


  @override
  Widget build(BuildContext context) {
    LocationService locationService = LocationService();
    double? distance;

    if (userPosition != null) {
      distance = locationService.calculateDistance(
        userLatitude: userPosition!.latitude,
        userLongitude: userPosition!.longitude,
        itemLatitude: item.latitude,
        itemLongitude: item.longitude,
      );
    }

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
    return Container(
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
      child: Column(
        children: [
          Stack(
            alignment: AlignmentGeometry.bottomLeft,
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.only(
                  topRight: Radius.circular(17),
                  topLeft: Radius.circular(17),
                ),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  height: height * 0.13,
                  width: double.infinity,
                  imageUrl: item.imageUrl,
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                      color: AppColors.greenColor,
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              Container(
                width: width * 0.15,
                margin: EdgeInsets.only(
                  left: width * 0.02,
                  bottom: height * 0.01,
                ),
                padding: EdgeInsets.symmetric(vertical: height * 0.01),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Text(conditions[item.conditionIndex],
                    style: AppStyles.extra8Green),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.02,
              vertical: height * 0.01,
            ),
            child: Column(
              spacing: height * 0.01,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(item.title,
                  style: theme.textTheme.displaySmall,
                ),
                Text(category.catogeries()[item.categoryIndex + 1].name ?? "",
                    style: theme.textTheme.displayMedium),
                Row(
                  spacing: width * 0.01,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      width: 5,
                      height: 5,
                    ),
                    Text(
                      distance != null
                          ? '${distance.toStringAsFixed(1)} km away'
                          : 'Location unavailable',
                      style: isDark
                          ? AppStyles.semi8DarkGreen
                          : AppStyles.semi8Green,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
