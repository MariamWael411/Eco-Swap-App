import 'package:eco_swap_app/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_colors.dart';
import 'app_config.dart';
import 'app_styles.dart';

class UtilsDialog {
  static late BuildContext _context;

  static BuildContext get context => _context;

  static set context(BuildContext value) {
    _context = value;
  }

  static var isDark = _context.read<ThemeCubit>().isDark();

  static void showLoading({
    required BuildContext context,
    required String content,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: isDark
              ? AppColors.containerColor
              : AppColors.whiteColor,
          content: Row(
            spacing: AppConfig.width(context) * 0.03,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                color: isDark
                    ? AppColors.darkGreenPrimaryColor
                    : AppColors.greenColor,
              ),
              Text(
                content,
                style: isDark
                    ? AppStyles.bold15GreenDark
                    : AppStyles.bold15Green,
              ),
            ],
          ),
        );
      },
    );
  }

  static void hideDialog({required BuildContext context}) {
    Navigator.pop(context);
  }

  static void showMessage({
    required BuildContext context,
    required String content,
    required String title,
    String? posAction,
    String? negAction,
    VoidCallback? negActions,
    VoidCallback? posActions,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        List<Widget> actions = [];
        if (posAction != null) {
          actions.add(
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                posActions?.call();
              },
              child: Text(
                posAction,
                style: isDark
                    ? AppStyles.bold15GreenDark.copyWith(fontSize: 13)
                    : AppStyles.bold15Green.copyWith(fontSize: 13),
              ),
            ),
          );
        }
        if (negAction != null) {
          actions.add(
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                negActions?.call();
              },
              child: Text(
                negAction,
                style: isDark
                    ? AppStyles.bold15GreenDark.copyWith(fontSize: 13)
                    : AppStyles.bold15Green.copyWith(fontSize: 13),
              ),
            ),
          );
        }
        return AlertDialog(
          backgroundColor: isDark
              ? AppColors.containerColor
              : AppColors.whiteColor,
          content: Text(
            content,
            style: isDark ? AppStyles.bold15GreenDark : AppStyles.bold15Green,
          ),
          title: Text(
            title,
            style: isDark
                ? AppStyles.bold15GreenDark.copyWith(fontSize: 13)
                : AppStyles.bold15Green.copyWith(fontSize: 13),
          ),
          actions: actions,
        );
      },
    );
  }
}
