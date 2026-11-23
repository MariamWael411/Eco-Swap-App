import 'package:cached_network_image/cached_network_image.dart';
import 'package:eco_swap_app/features/common/widgets/custom_loading_circular_widget.dart';
import 'package:flutter/material.dart';

class CustomCahcedNetwork extends StatelessWidget {
  CustomCahcedNetwork({
    super.key,
    required this.imageUrl,
    required this.imageHieght,
    required this.imageWidth,
  });

  String imageUrl;
  double imageWidth;
  double imageHieght;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.fill,
      height: imageHieght,
      width: imageWidth,
      imageUrl: imageUrl,
      placeholder: (context, url) => CustomLoadingCircularWidget(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
