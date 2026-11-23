import 'package:eco_swap_app/core/di/di.dart';
import 'package:eco_swap_app/features/add_item/domain/entity/item.dart';
import 'package:eco_swap_app/features/common/widgets/custom_cahced_network.dart';
import 'package:eco_swap_app/features/home/ui/tabs/request/cubit/request_cubit.dart';
import 'package:eco_swap_app/features/home/ui/tabs/request/cubit/request_states.dart';
import 'package:eco_swap_app/features/network/model/app_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_config.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../../../../../core/utils/utils_dialog.dart';
import '../../../../../../core/utils/utils_toast.dart';
import '../../../../../../cubit/my_user_cubit.dart';
import '../../../../../../cubit/theme_cubit.dart';
import '../../../../../../l10n/app_localizations.dart';
import '../../../../../common/widgets/custom_elevated_button.dart';
import '../../../../domain/entities/request.dart';
import '../../profile/widget/custom_name_widget.dart';

class CustomSentItem extends StatelessWidget {
  CustomSentItem({super.key, required this.item, required this.request});

  Item item;
  Request request;
  var cubit = getIt<RequestCubit>();

  @override
  Widget build(BuildContext context) {
    UtilsDialog.context = context;
    UtilsDialog utilsDialog = UtilsDialog();
    var width = AppConfig.width(context);
    var height = AppConfig.height(context);
    final isDark = context.read<ThemeCubit>().isDark();
    var theme = Theme.of(context);
    var language = AppLocalizations.of(context)!;
    String text = AppModel.requestStatus(context)[request.statusIndex];
    var user = context.watch<MyUserCubit>().state;
    String userName = user.fullName
        .split(' ')
        .map((word) {
          if (word.isEmpty) return word;

          return word[0].toUpperCase() + word.substring(1).toLowerCase();
        })
        .join(' ');
    return Container(
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
                name: userName,
                widthCon: 0.091 * width,
                heightCon: height * 0.04,
              ),
              Expanded(
                child: Column(
                  spacing: height * 0.01,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(userName, style: theme.textTheme.displaySmall),
                    Text(
                      "${language.requested} ${timeago.format(
                          request.createdAt)}",
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
                  child: CustomCahcedNetwork(
                    imageUrl: item.imageUrl,
                    imageHieght: height * 0.06,
                    imageWidth: width * 0.13,
                  )),
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
                        item.title,
                        style: theme.textTheme.displaySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: request.statusIndex == 1,
            child: Row(
              spacing: width * 0.03,
              children: [
                Expanded(
                  child: BlocListener<RequestCubit, RequestStates>(
                    bloc: cubit,
                    listenWhen: (previous, current) =>
                    current.requestStates.isSuccess &&
                        current.action == 'cancel',
                    listener: (context, state) {
                      UtilsToast.toastSuccess(language.success,
                          language.request_canceled_successfully, context);
                    },
                    child: CustomElevatedButton(
                      onClick: () {
                        var updatedRequest = request.copyWith(
                            statusIndex: 2
                        );
                        cubit.updateRequest(
                          updatedRequest,
                          action: 'cancel',
                        );
                      },
                      backgroundColor: isDark
                          ? AppColors.containerColor
                          : AppColors.whiteColor,
                      borderColor: theme.colorScheme.onPrimary,
                      item: Text(
                        language.cancel_request,
                        style: theme.textTheme.headlineMedium,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
