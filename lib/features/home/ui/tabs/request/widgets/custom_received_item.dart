import 'package:cached_network_image/cached_network_image.dart';
import 'package:eco_swap_app/core/utils/firebase_utils.dart';
import 'package:eco_swap_app/features/add_item/ui/cubit/item_cubit.dart';
import 'package:eco_swap_app/features/add_item/ui/cubit/item_states.dart';
import 'package:eco_swap_app/features/home/ui/tabs/profile/widget/custom_name_widget.dart';
import 'package:eco_swap_app/features/home/ui/tabs/request/cubit/request_states.dart';
import 'package:eco_swap_app/features/network/model/app_model.dart';
import 'package:eco_swap_app/features/network/model/my_user_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../../../core/di/di.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_config.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../../../../../core/utils/utils_dialog.dart';
import '../../../../../../cubit/my_user_cubit.dart';
import '../../../../../../cubit/theme_cubit.dart';
import '../../../../../../l10n/app_localizations.dart';
import '../../../../../add_item/domain/entity/item.dart';
import '../../../../../common/widgets/custom_elevated_button.dart';
import '../../../../domain/entities/request.dart';
import '../cubit/request_cubit.dart';

class CustomReceivedItem extends StatefulWidget {
  CustomReceivedItem(
      {super.key, required this.request, required this.item, required this.isAccept});

  Item item;
  Request request;
  bool isAccept;

  @override
  State<CustomReceivedItem> createState() => _CustomReceivedItemState();
}

class _CustomReceivedItemState extends State<CustomReceivedItem> {
  var cubit = getIt<RequestCubit>();
  var cubitItem = getIt<ItemCubit>();


  @override
  Widget build(BuildContext context) {
    UtilsDialog.context = context;
    UtilsDialog utilsDialog = UtilsDialog();
    var width = AppConfig.width(context);
    var height = AppConfig.height(context);
    final isDark = context.read<ThemeCubit>().isDark();
    var theme = Theme.of(context);
    var language = AppLocalizations.of(context)!;
    String text = AppModel.requestStatus(context)[widget.request.statusIndex];
    var user = context.watch<MyUserCubit>().state;
    String userName = user.fullName
        .split(' ')
        .map((word) {
      if (word.isEmpty) return word;

      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    })
        .join(' ');
    return FutureBuilder<MyUserDto?>(
      future: FirebaseUtils
          .getUserFromFireStore(widget.request.senderId)
          .first,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (snapshot.hasError || !snapshot.hasData) {
          return Text('User not found');
        }

        MyUserDto user = snapshot.data;
        return BlocListener<RequestCubit, RequestStates>(
          bloc: cubit,
          listener: (BuildContext context, RequestStates state) {
            if (state.requestStates.isSuccess &&
                state.action == 'accept') {
              utilsDialog.showMessage(
                context: context,
                content: "request accepted successfully",
                title: language.success,
                posAction: language.ok,
                posActions: () {},
              );
            }

            if (state.requestStates.isSuccess &&
                state.action == 'reject') {
              utilsDialog.showMessage(
                context: context,
                content: " request rejected successfully",
                title: language.success,
                posAction: language.ok,
                posActions: () {},
              );
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.03,
              vertical: height * 0.014,
            ),
            margin: EdgeInsets.symmetric(
              horizontal: width * 0.01,
              vertical: height * 0.01,
            ),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  spreadRadius: 1,
                  offset: const Offset(0, 3),
                ),
              ],
              color: theme.colorScheme.onPrimaryFixedVariant,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: theme.colorScheme.onPrimary),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: height * 0.02,
              children: [
                Row(
                  spacing: width * 0.03,
                  children: [
                    CustomNameWidget(
                      textStyle: AppStyles.extra20Green.copyWith(fontSize: 12),
                      name: user.fullName,
                      widthCon: 0.091 * width,
                      heightCon: height * 0.04,
                    ),
                    Expanded(
                      child: Column(
                        spacing: height * 0.01,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(user.fullName, style: theme.textTheme
                              .displaySmall),
                          Text(
                            "Requested ${timeago.format(
                                widget.request.createdAt)}",
                            style: theme.textTheme.displayMedium,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.024,
                        vertical: height * 0.007,
                      ),
                      decoration: BoxDecoration(
                        color: text == language.accepted
                            ? theme.colorScheme.onInverseSurface
                            : text == language.cancelled
                            ? theme.colorScheme.onSecondary
                            : theme.colorScheme.onSurfaceVariant,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Text(
                        text,
                        style: text == language.accepted
                            ? theme.textTheme.bodySmall
                            : (!isDark
                            ? (text == language.cancelled
                            ? AppStyles.reg10Grey
                            : AppStyles.extra8Yellow)
                            : (text == language.cancelled
                            ? AppStyles.reg10LightGreen
                            : AppStyles.extra8DarkYellow)),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.03,
                    vertical: height * 0.013,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onSecondary,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Row(
                    spacing: width * 0.03,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(9),
                        child: CachedNetworkImage(
                          fit: BoxFit.fill,
                          height: height * 0.06,
                          width: width * 0.13,
                          imageUrl: widget.item.imageUrl,
                          placeholder: (context, url) =>
                              Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.greenColor,
                                ),
                              ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          spacing: height * 0.01,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              language.item_request,
                              style: theme.textTheme.labelLarge,
                            ),
                            Text(
                              widget.item.title,
                              style: theme.textTheme.displaySmall,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: widget.request.statusIndex == 1,
                  child: BlocListener<ItemCubit, ItemStates>(
                    bloc: cubitItem,
                    listener: (context, state) {

                    },
                    child: Row(
                      spacing: width * 0.03,
                      children: [
                        Expanded(
                          child: CustomElevatedButton(
                            onClick: () {
                              //todo delete
                              // cubit.deleteRequest(widget.request);

                              var updatedRequest = widget.request.copyWith(
                                statusIndex: 3,
                              );

                              cubit.updateRequest(
                                updatedRequest,
                                action: 'reject',
                              );
                            },
                            backgroundColor: isDark
                                ? AppColors.containerColor
                                : AppColors.whiteColor,
                            borderColor: theme.colorScheme.onPrimary,
                            item: Row(
                              spacing: width * 0.02,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.close,
                                  color: !isDark
                                      ? AppColors.blackColor
                                      : AppColors.textDarkColor,
                                ),
                                Text(
                                  language.decline,
                                  style: theme.textTheme.headlineMedium,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: CustomElevatedButton(
                            onClick: () async {
                              //todo accept
                              var updatedRequest = widget.request.copyWith(
                                statusIndex: 0,
                              );

                              await cubit.updateRequest(
                                updatedRequest,
                                action: 'accept',
                              );

                              var updatedItem = widget.item.copyWith(
                                statusIndex: 1,
                              );

                              await cubitItem.editItem(updatedItem);
                            },
                            item: Row(
                              spacing: width * 0.02,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.check,
                                  color: !isDark
                                      ? AppColors.whiteColor
                                      : AppColors.blackColor,
                                ),
                                Text(
                                  language.accept,
                                  style: theme.textTheme.labelSmall,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },

    );
  }
}
