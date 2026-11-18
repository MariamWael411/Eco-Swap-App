import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  String text;

  CustomTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Text(text, style: theme.textTheme.displaySmall);
  }
}
