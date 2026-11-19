import 'package:eco_swap_app/features/home/ui/tabs/request/widgets/custom_received_item.dart';
import 'package:flutter/material.dart';

class CustomReceivedWidget extends StatelessWidget {
  const CustomReceivedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return CustomReceivedItem();
      },
    );
  }
}
