import 'package:eco_swap_app/core/utils/app_config.dart';
import 'package:eco_swap_app/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomElevatedButton extends StatelessWidget {
  String? text;
  VoidCallback onClick;
  Widget? item;
  Color? backgroundColor;
  Color borderColor;
  double? paddingVertical;
  double? paddingHorizontal;

  CustomElevatedButton({

    super.key,
    this.paddingHorizontal,
    this.paddingVertical,
    this.backgroundColor,
    this.text,
    required this.onClick,
    this.item,
    this.borderColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    var width = AppConfig.width(context);
    var height = AppConfig.height(context);
    bool isDark = context.read<ThemeCubit>().isDark();

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: (backgroundColor == null)
            ? Theme.of(context).colorScheme.primary
            : backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: EdgeInsets.symmetric(
            vertical: paddingVertical ?? height * 0.017,
            horizontal: paddingHorizontal ?? 0),
        side: BorderSide(color: borderColor, width: 2),
      ),
      onPressed: onClick,
      child: (item == null)
          ? Text(text!, style: Theme.of(context).textTheme.labelSmall)
          : item,
    );
  }
}
