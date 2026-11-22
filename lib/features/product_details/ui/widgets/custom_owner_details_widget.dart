import 'package:eco_swap_app/core/utils/firebase_utils.dart';
import 'package:eco_swap_app/features/network/model/my_user_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_config.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../cubit/my_user_cubit.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../home/ui/tabs/profile/widget/custom_name_widget.dart';

class CustomOwnerDetailsWidget extends StatelessWidget {
  CustomOwnerDetailsWidget(
      {super.key, required this.onTap, required this.userId});

  VoidCallback onTap;
  String userId;

  @override
  Widget build(BuildContext context) {
    var width = AppConfig.width(context);

    var height = AppConfig.height(context);

    var theme = Theme.of(context);
    var language = AppLocalizations.of(context)!;
    var user = context.watch<MyUserCubit>().state;

    String userName = user.fullName
        .split(' ')
        .map((word) {
          if (word.isEmpty) return word;

          return word[0].toUpperCase() + word.substring(1).toLowerCase();
        })
        .join(' ');
    return FutureBuilder<MyUserDto?>(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (snapshot.hasError || !snapshot.hasData) {
          return Text('User not found');
        }

        var user = snapshot.data;
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.03,
            vertical: height * 0.02,
          ),
          decoration: BoxDecoration(
            color: theme.colorScheme.onSecondary,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: theme.colorScheme.onPrimary),
          ),
          child: Row(
            spacing: width * 0.02,
            children: [
              CustomNameWidget(
                textStyle: AppStyles.extra20Green.copyWith(fontSize: 12),
                widthCon: width * 0.12,
                heightCon: height * 0.054,
                name: user!.fullName,
              ),
              Expanded(
                child: Column(
                  spacing: height * 0.01,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(language.offered_by,
                        style: theme.textTheme.displayMedium),
                    Text(
                      user.fullName,
                      style: theme.textTheme.displaySmall?.copyWith(
                          fontSize: 12),
                    ),
                    Row(
                      spacing: width * 0.02,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          width: 5,
                          height: 5,
                        ),
                        Text(
                          " Active donor · ${user
                              .numberOfSharedItem} items shared",
                          style: theme.textTheme.displayMedium?.copyWith(
                            fontSize: 8,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: onTap,
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: theme.colorScheme.onSecondaryContainer,
                ),
              ),
            ],
          ),
        );
      },
      future: FirebaseUtils
          .getUserFromFireStore(userId)
          .first,

    );
  }
}
