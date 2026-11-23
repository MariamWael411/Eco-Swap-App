import 'package:flutter/material.dart';

class CustomLoadingCircularWidget extends StatelessWidget {
  const CustomLoadingCircularWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
