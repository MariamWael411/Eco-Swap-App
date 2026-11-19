import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../cubit/theme_cubit.dart';

typedef ChangeTheme = void Function(bool)?;

class CustomSwitchWidget extends StatelessWidget {
  CustomSwitchWidget({super.key, required this.changeTheme});

  ChangeTheme changeTheme;

  @override
  Widget build(BuildContext context) {
    final isDark = context.read<ThemeCubit>().isDark();
    return Switch(
      value: (isDark),
      inactiveThumbColor: AppColors.whiteColor,
      activeThumbColor: AppColors.whiteColor,
      activeTrackColor: AppColors.darkGreenPrimaryColor,
      inactiveTrackColor: AppColors.darkGreyColor,
      trackOutlineColor: WidgetStateProperty.resolveWith<Color?>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.transparentColor;
        }
        return AppColors.whiteColor;
      }),

      onChanged: changeTheme,
    );
  }
}
