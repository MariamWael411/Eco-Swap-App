import 'package:eco_swap_app/features/home/ui/tabs/request/widgets/custom_sent_item.dart';
import 'package:flutter/material.dart';

class CustomSentWidget extends StatelessWidget {
  const CustomSentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return CustomSentItem();
      },
    );
  }
}
