import 'package:eco_swap_app/features/add_item/ui/cubit/item_states.dart';
import 'package:eco_swap_app/features/home/domain/entities/request.dart';
import 'package:eco_swap_app/features/home/ui/tabs/request/widgets/custom_received_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/di/di.dart';
import '../../../../../add_item/ui/cubit/item_cubit.dart';

class CustomReceivedWidget extends StatefulWidget {
  CustomReceivedWidget({super.key, required this.requests});

  List<Request> requests;

  @override
  State<CustomReceivedWidget> createState() => _CustomReceivedWidgetState();
}

class _CustomReceivedWidgetState extends State<CustomReceivedWidget> {
  var cubit = getIt<ItemCubit>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit.getItem();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemCubit, ItemStates>(
      builder: (context, state) {
        if (state.itemStates.isSuccess) {
          var data = state.itemStates.data!;
          var sentItems = data.where((item) {
            return widget.requests.any((request) {
              return request.itemId == item.itemId;
            });
          }).toList();
          return sentItems.isEmpty ? Center(child: Text(
            "No Request Received Yet", style: TextStyle(fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black),),) : ListView.builder(
            itemCount: sentItems.length,
            itemBuilder: (context, index) {
              var item = sentItems[index];

              var request = widget.requests.firstWhere(
                    (request) => request.itemId == item.itemId,
              );
              return CustomReceivedItem(
                item: sentItems[index], request: request, isAccept: false,);
            },
          );
        }
        else if (state.itemStates.isError) {
          return Center(child: Text(state.itemStates.errorMessage ?? "",
            style: TextStyle(fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black),),);
        } else {
          return Center(child: CircularProgressIndicator(),);
        }
      },
      bloc: cubit,

    );
  }
}
