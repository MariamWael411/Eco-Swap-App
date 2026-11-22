import 'package:eco_swap_app/core/di/di.dart';
import 'package:eco_swap_app/core/utils/utils_dialog.dart';
import 'package:eco_swap_app/cubit/my_user_cubit.dart';
import 'package:eco_swap_app/features/common/widgets/custom_elevated_button.dart';
import 'package:eco_swap_app/features/home/domain/entities/request.dart';
import 'package:eco_swap_app/features/home/ui/tabs/home/model/category.dart';
import 'package:eco_swap_app/features/home/ui/tabs/request/cubit/request_cubit.dart';
import 'package:eco_swap_app/features/home/ui/tabs/request/cubit/request_states.dart';
import 'package:eco_swap_app/features/network/model/app_model.dart';
import 'package:eco_swap_app/features/product_details/ui/widgets/custom_catogery_widget.dart';
import 'package:eco_swap_app/features/product_details/ui/widgets/custom_owner_details_widget.dart';
import 'package:eco_swap_app/features/product_details/ui/widgets/custom_product_container.dart';
import 'package:eco_swap_app/features/product_details/ui/widgets/custom_security_widget.dart';
import 'package:eco_swap_app/features/product_details/ui/widgets/custom_stack_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

import '../../../core/utils/app_config.dart';
import '../../../cubit/theme_cubit.dart';
import '../../../l10n/app_localizations.dart';
import '../../add_item/domain/entity/item.dart';

class ProductDetailsScreen extends StatefulWidget {
  ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late Item args;
  var cubit = getIt<RequestCubit>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit.getRequest();
  }

  @override
  Widget build(BuildContext context) {
    UtilsDialog.context = context;
    UtilsDialog utilsDialog = UtilsDialog();

    Category category = Category();
    category.context = context;
    args = ModalRoute.of(context)?.settings.arguments as Item;
    String time = timeago.format(args.date);
    var user = context.watch<MyUserCubit>().state;

    var width = AppConfig.width(context);

    var height = AppConfig.height(context);
    final isDark = context.read<ThemeCubit>().isDark();
    var theme = Theme.of(context);
    var language = AppLocalizations.of(context)!;
    List<String> conditions = [
      language.like_new,
      language.good,
      language.well_used,
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomStackWidget(
              imageUrl: args.imageUrl,
              backClick: () {
                Navigator.of(context).pop();
              },
              favClick: () {
                //todo add to favorite
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.04,
                vertical: height * 0.02,
              ),
              child: Column(
                spacing: height * 0.01,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomCatogeryWidget(
                    category:
                        category.catogeries()[args.categoryIndex + 1].name ??
                        "",
                    status: AppModel.itemStatus(context)[args.statusIndex],
                  ),
                  SizedBox(height: height * 0.01),
                  Text(args.title, style: theme.textTheme.bodyLarge),
                  Text(
                    "${conditions[args.conditionIndex]} • Added $time",
                    style: theme.textTheme.displayMedium,
                  ),
                  SizedBox(height: height * 0.01),
                  Divider(color: theme.colorScheme.onPrimary),
                  Text(
                    language.about_this_item,
                    style: theme.textTheme.bodyLarge?.copyWith(fontSize: 14),
                  ),
                  Text(
                    args.description,
                    style: theme.textTheme.displayMedium?.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  CustomOwnerDetailsWidget(
                    userId: args.userId,
                    onTap: (telegramUsername) async {
                      if (user.id == args.userId) return;

                      final request = cubit.getAcceptedRequest(
                        itemId: args.itemId!,
                        senderId: user.id,
                        receiverId: args.userId,
                      );

                      if (request == null) {
                        utilsDialog.showMessage(
                          context: context,
                          title: language.error,
                          content: "Your request has not been accepted yet.",
                          posAction: language.ok,
                          posActions: () {
                            Navigator.pop(context);
                          },
                        );
                        return;
                      }

                      if (telegramUsername.isEmpty) {
                        utilsDialog.showMessage(
                          context: context,
                          title: language.error,
                          content: "Telegram username is not available.",
                          posAction: language.ok,
                          posActions: () {
                            Navigator.pop(context);
                          },
                        );
                        return;
                      }

                      final username = telegramUsername
                          .replaceAll('@', '')
                          .trim();

                      final telegramUrl = Uri.parse('https://t.me/$username');

                      try {
                        final result = await launchUrl(
                          telegramUrl,
                          mode: LaunchMode.externalApplication,
                        );

                        debugPrint('Launch result: $result');
                      } catch (e) {
                        debugPrint('Telegram launch error: $e');
                      }
                    },
                  ),
                  CustomSecurityWidget(),
                  SizedBox(height: height * 0.01),
                  CustomProductContainer(),
                  SizedBox(height: height * 0.01),

                  BlocListener<RequestCubit, RequestStates>(
                    bloc: cubit,
                    listenWhen: (previous, current) =>
                        current.requestStates.isSuccess &&
                        current.action == 'add_request',
                    listener: (context, state) {
                      utilsDialog.showMessage(
                        context: context,
                        content: "request added successfully",
                        title: language.success,
                        posAction: language.ok,
                        posActions: () {
                          Navigator.of(context).pop();
                        },
                      );
                    },

                    child: Visibility(
                      visible: user.id != args.userId && args.statusIndex == 0,
                      child: CustomElevatedButton(
                        onClick: () {
                          //todo send request
                          var request = Request(
                            statusIndex: 1,
                            itemId: args.itemId!,
                            senderId: user.id,
                            receiverId: args.userId,
                            createdAt: DateTime.now(),
                          );
                          cubit.addRequest(request);
                        },
                        text: language.request_this_item,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.015),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
