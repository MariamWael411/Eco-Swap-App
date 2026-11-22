import 'package:eco_swap_app/core/di/di.dart';
import 'package:eco_swap_app/core/utils/app_colors.dart';
import 'package:eco_swap_app/cubit/my_user_cubit.dart';
import 'package:eco_swap_app/features/home/ui/tabs/request/cubit/request_cubit.dart';
import 'package:eco_swap_app/features/home/ui/tabs/request/cubit/request_states.dart';
import 'package:eco_swap_app/features/home/ui/tabs/request/widgets/custom_received_widget.dart';
import 'package:eco_swap_app/features/home/ui/tabs/request/widgets/custom_sent_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_config.dart';
import '../../../../../cubit/theme_cubit.dart';
import '../../../../../l10n/app_localizations.dart';

class RequestTab extends StatefulWidget {
  const RequestTab({super.key});

  @override
  State<RequestTab> createState() => _RequestTabState();
}

class _RequestTabState extends State<RequestTab> {

  var cubit = getIt<RequestCubit>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit.getRequest();
  }
  @override
  Widget build(BuildContext context) {
    var width = AppConfig.width(context);
    var height = AppConfig.height(context);
    final isDark = context.read<ThemeCubit>().isDark();
    var theme = Theme.of(context);
    var user = context
        .watch<MyUserCubit>()
        .state;

    var language = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.03,
          vertical: height * 0.03
      ),
      child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: height * 0.01,
                    horizontal: width * 0.013
                ),
                decoration: BoxDecoration(
                    color: theme.colorScheme.onSecondary,
                    borderRadius: BorderRadius.circular(13)
                ),
                child: TabBar(

                  unselectedLabelStyle: theme.textTheme.bodyMedium,
                  labelStyle: theme.textTheme.headlineLarge,

                  labelPadding: EdgeInsets.only(
                      top: height * 0.01
                  ),
                  indicator: BoxDecoration(
                      color: isDark ? AppColors.green2Color : AppColors
                          .whiteColor,
                      borderRadius: BorderRadius.circular(12)
                  ),
                  indicatorWeight: height * 0.016,
                  dividerColor: AppColors.transparentColor,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    Text(language.received),
                    Text(language.sent),


                  ],),
              ),
              SizedBox(height: height * 0.02,),
              Expanded(
                child: TabBarView(children: [
                  BlocBuilder<RequestCubit, RequestStates>(
                    bloc: cubit,
                    builder: (context, state) {
                      if (state.requestStates.isSuccess) {
                        var data = state.requestStates.data!;
                        var receivedReq = data.where((element) =>
                        element.receiverId == user.id,).toList();
                        return CustomReceivedWidget(requests: receivedReq,);
                      } else if (state.requestStates.isError) {
                        return Center(child: Text(
                          state.requestStates.errorMessage ?? "",
                          style: TextStyle(fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),),);
                      } else {
                        return Center(child: CircularProgressIndicator(),);
                      }
                    },
                  ),
                  BlocBuilder<RequestCubit, RequestStates>(
                    bloc: cubit,
                    builder: (context, state) {
                      if (state.requestStates.isSuccess) {
                        var data = state.requestStates.data!;
                        var sentReq = data.where((element) =>
                        element.senderId == user.id,).toList();

                        return CustomSentWidget(requests: sentReq,);
                      } else if (state.requestStates.isError) {
                        return Center(child: Text(
                          state.requestStates.errorMessage ?? "",
                          style: TextStyle(fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),),);
                      } else {
                        return Center(child: CircularProgressIndicator(),);
                      }
                    },
                  ),

                ]),
              )
            ],
          )),
    );
  }
}
