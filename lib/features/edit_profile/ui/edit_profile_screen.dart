import 'package:eco_swap_app/core/di/di.dart';
import 'package:eco_swap_app/core/utils/utils_dialog.dart';
import 'package:eco_swap_app/features/common/widgets/custom_app_bar.dart';
import 'package:eco_swap_app/features/common/widgets/custom_elevated_button.dart';
import 'package:eco_swap_app/features/edit_profile/ui/cubit/edit_profile_cubit.dart';
import 'package:eco_swap_app/features/edit_profile/ui/cubit/edit_profile_states.dart';
import 'package:eco_swap_app/features/edit_profile/ui/widgets/custom_edit_profile_container.dart';
import 'package:eco_swap_app/features/home/ui/tabs/profile/widget/custom_name_widget.dart';
import 'package:eco_swap_app/features/network/model/my_user_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_config.dart';
import '../../../core/utils/validation.dart';
import '../../../cubit/my_user_cubit.dart';
import '../../../l10n/app_localizations.dart';
import '../../auth/ui/widget/custom_text_widget.dart';
import '../../common/widgets/custom_text_form_feild.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var cubit = getIt<EditProfileCubit>();

  @override
  Widget build(BuildContext context) {
    UtilsDialog.context = context;
    UtilsDialog utilsDialog = UtilsDialog();
    Validation.context = context;
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

    return Scaffold(
      appBar: customAppBar(theme, language, context, language.edit_profile),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: height * 0.03,
        ),
        child: SingleChildScrollView(
          child: Column(
            spacing: height * 0.01,
            children: [
              CustomNameWidget(name: userName),
              FForm(
                key: _formKey,
                child: BlocListener<EditProfileCubit, EditProfileStates>(
                  bloc: cubit,
                  listener: (context, state) {
                    if (state.editProfileStates.isLoading) {
                      utilsDialog.showLoading(
                        context: context,
                        content: language.loading,
                      );
                    } else if (state.editProfileStates.isSuccess) {
                      utilsDialog.hideDialog(context: context);
                      utilsDialog.showMessage(
                        context: context,
                        content: "updated Successfully",
                        title: language.success,
                        posAction: language.ok,
                        posActions: () {
                          Navigator.of(context).pop();
                        },

                      );
                    }
                    else if (state.editProfileStates.isError) {
                      utilsDialog.hideDialog(context: context);
                      utilsDialog.showMessage(
                        context: context,
                        content:
                        state.editProfileStates.errorMessage ??
                            "",
                        title: language.error,
                        posAction: language.ok,

                      );
                    }
                  },
                  child: Column(
                    spacing: height * 0.01,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: height * 0.01),

                      CustomTextWidget(text: language.full_name),

                      CustomTextFormFeild(
                        controller: nameController,
                        onValidator: (text) {
                          return Validation.validateFullName(text);
                        },
                        hintText: language.enter_your_name,
                        prefixIcon: Icon(Icons.person_outline),
                      ),
                      SizedBox(height: height * 0.01),

                      CustomTextWidget(text: language.email_address),

                      CustomTextFormFeild(
                        controller: emailController,
                        onValidator: (text) {
                          return Validation.validateEmail(text);
                        },
                        textInputType: TextInputType.emailAddress,
                        hintText: language.enter_your_email,
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                      SizedBox(height: height * 0.01),

                      CustomTextWidget(text: language.phone_number),

                      CustomTextFormFeild(
                        controller: phoneController,
                        onValidator: (text) {
                          return Validation.validateMobileNum(text);
                        },
                        textInputType: TextInputType.phone,
                        hintText: language.enter_your_phone,
                        prefixIcon: Icon(Icons.phone_outlined),
                      ),
                      SizedBox(height: height * 0.01),
                      CustomEditProfileContainer(),
                      SizedBox(height: height * 0.01),
                      CustomElevatedButton(
                        onClick: () {
                          //todo update profile
                          if (_formKey.currentState?.validate() == true) {
                            var updatedUser = MyUserDto(id: user.id,
                                email: emailController.text,
                                fullName: nameController.text,
                                mobilNumber: phoneController.text);
                            cubit.editProfile(updatedUser);
                            context.read<MyUserCubit>().changeUser(updatedUser);
                          }
                        },
                        text: language.save_changes,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
