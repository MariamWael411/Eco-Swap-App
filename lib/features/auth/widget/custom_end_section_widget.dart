import 'package:flutter/material.dart';

class CustomEndSectionWidget extends StatelessWidget {
  CustomEndSectionWidget({
    super.key,
    required this.text1,
    required this.text2,
    required this.onClick,
  });

  String text1;
  String text2;
  VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text1, style: theme.textTheme.displayMedium),
        TextButton(
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          onPressed: onClick,
          child: Text(text2, style: theme.textTheme.headlineLarge),
        ),
      ],
    );
  }
}
