import 'package:eco_swap_app/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmar extends StatelessWidget {
  CustomShimmar({super.key, required this.child});

  Widget child;

  @override
  Widget build(BuildContext context) {
    var isDark = context.read<ThemeCubit>().isDark();

    return Shimmer.fromColors(
      period: Duration(seconds: 1),
      enabled: true,
      baseColor: isDark ? const Color(0xFF303030) : const Color(0xFFE0E0E0),
      highlightColor: isDark
          ? const Color(0xFF424242)
          : const Color(0xFFF5F5F5),
      child: child,
    );
  }
}
