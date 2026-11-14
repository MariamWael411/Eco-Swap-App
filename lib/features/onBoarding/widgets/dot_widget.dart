import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_config.dart';
import '../../../../cubit/theme_cubit.dart';

class DotWidget extends StatelessWidget {
  bool isActive;

  DotWidget({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    var width = AppConfig.width(context);
    var height = AppConfig.height(context);
    final isDark = context.read<ThemeCubit>().isDark();
    var theme = Theme.of(context);
    return AnimatedContainer(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: isActive
            ? theme.colorScheme.primary
            : theme.colorScheme.onPrimary,
      ),
      curve: Curves.ease,
      width: isActive ? width * 0.06 : width * 0.02,
      height: height * 0.008,

      duration: Duration(milliseconds: 500),
    );
  }
}
