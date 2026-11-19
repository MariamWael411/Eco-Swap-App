import 'package:flutter/material.dart';

AppBar customAppBar(var theme, var language, var context, String text) {
  return AppBar(
    shape: Border(
      bottom: BorderSide(width: 1, color: theme.colorScheme.onPrimaryContainer),
    ),
    centerTitle: true,
    title: Text(text, style: Theme.of(context).textTheme.titleMedium),
    leading: IconButton(
      onPressed: () {
        //todo add Item
        Navigator.of(context).pop();
      },
      style: IconButton.styleFrom(
        backgroundColor: theme.colorScheme.inversePrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: BorderSide(width: 1, color: theme.colorScheme.onSecondary),
        ),
      ),
      icon: Icon(
        Icons.arrow_back_ios_new,
        size: 20,
        color: theme.colorScheme.onSecondaryContainer,
      ),
    ),
  );
}
