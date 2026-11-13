import 'package:eco_swap_app/core/utils/app_colors.dart';
import 'package:eco_swap_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

typedef OnChanged = void Function(String);
typedef OnValidator = String? Function(String?);

class CustomTextFormFeild extends StatelessWidget {
  String hintText;

  Icon? prefixIcon;
  Widget? sufixIcon;
  int maxLines;
  OnChanged? onChanged;
  TextEditingController? controller;
  OnValidator? onValidator;
  TextInputType? textInputType;
  bool obscureText;

  CustomTextFormFeild({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.sufixIcon,
    this.maxLines = 1,
    this.controller,
    this.onChanged,
    this.onValidator,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      obscureText: obscureText,
      obscuringCharacter: '*',
      onChanged: onChanged,
      validator: onValidator,
      controller: controller,
      style: Theme.of(context).textTheme.titleLarge,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintStyle: Theme.of(context).textTheme.titleLarge,
        hintText: hintText,
        prefixIcon: prefixIcon,
        prefixIconColor: Theme.of(context).colorScheme.onPrimaryContainer,
        suffixIconColor: Theme.of(context).colorScheme.onPrimaryContainer,
        suffixIcon: sufixIcon,
        errorStyle: AppStyles.med14Red,
        enabledBorder: _outlineInputBorder(context),
        border: _outlineInputBorder(context),
        focusedBorder: _outlineInputBorder(context),
        errorBorder: _outlineInputBorder(
          context,
        ).copyWith(borderSide: BorderSide(color: AppColors.redColor)),
        focusedErrorBorder: _outlineInputBorder(
          context,
        ).copyWith(borderSide: BorderSide(color: AppColors.redColor)),
        filled: true,
        fillColor: Theme.of(context).colorScheme.onSecondary,
      ),
    );
  }

  OutlineInputBorder _outlineInputBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.onPrimary,
        width: 2,
      ),
    );
  }
}
