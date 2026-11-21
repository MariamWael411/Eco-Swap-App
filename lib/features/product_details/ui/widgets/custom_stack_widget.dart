import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_config.dart';

class CustomStackWidget extends StatelessWidget {
  CustomStackWidget({
    super.key,
    required this.backClick,
    required this.favClick,
    required this.imageUrl
  });

  String imageUrl;
  VoidCallback backClick;
  VoidCallback favClick;

  @override
  Widget build(BuildContext context) {
    var height = AppConfig.height(context);
    var width = AppConfig.width(context);

    var theme = Theme.of(context);

    return Stack(
      children: [
        CachedNetworkImage(
          fit: BoxFit.fill,
          height: height * 0.4,
          width: double.infinity,
          imageUrl: imageUrl,
          placeholder: (context, url) => Center(
            child: CircularProgressIndicator(color: AppColors.greenColor),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.04,
            vertical: height * 0.05,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: backClick,
                style: IconButton.styleFrom(
                  backgroundColor: theme.colorScheme.inversePrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                    side: BorderSide(
                      width: 1,
                      color: theme.colorScheme.onSecondary,
                    ),
                  ),
                ),
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  size: 20,
                  color: theme.colorScheme.onSecondaryContainer,
                ),
              ),
              IconButton(
                onPressed: favClick,
                style: IconButton.styleFrom(
                  backgroundColor: theme.colorScheme.inversePrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                    side: BorderSide(
                      width: 1,
                      color: theme.colorScheme.onSecondary,
                    ),
                  ),
                ),
                icon: Icon(
                  Icons.favorite_border,
                  size: 20,
                  color: theme.colorScheme.onSecondaryContainer,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
