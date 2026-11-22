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
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/utils/app_config.dart';
import '../../../core/utils/utils_toast.dart';
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
  late var nameController;

  late var phoneController;

  late var teleUserNameController;
  final _formKey = GlobalKey<FormState>();
  var cubit = getIt<EditProfileCubit>();
  late MyUserDto user;
  bool isInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!isInitialized) {
      user = context
          .watch<MyUserCubit>()
          .state;
      nameController = TextEditingController(text: user.fullName);
      phoneController = TextEditingController(text: user.mobilNumber);
      teleUserNameController = TextEditingController(text: user.userName);


      isInitialized = true;
    }
  }
  @override
  Widget build(BuildContext context) {
    UtilsDialog.context = context;
    UtilsDialog utilsDialog = UtilsDialog();
    Validation.context = context;
    var width = AppConfig.width(context);
    var height = AppConfig.height(context);
    var theme = Theme.of(context);
    var language = AppLocalizations.of(context)!;

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
              Form(
                key: _formKey,
                child: BlocListener<EditProfileCubit, EditProfileStates>(
                  bloc: cubit,
                  listenWhen: (previous, current) =>
                  current.editProfileStates.isSuccess,
                  listener: (context, state) async {
                    UtilsToast.toastSuccess(
                        language.success, language.profile_updated_successfully,
                        context);
                    await Future.delayed(const Duration(seconds: 3));
                    if (!context.mounted) return;
                    Navigator.of(context).pop();
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
                      CustomTextWidget(text: language.telegram_user_name),
                      CustomTextFormFeild(
                        controller: teleUserNameController,
                        onValidator: (text) {
                          return Validation.validateTelegramUsername(text);
                        },
                        textInputType: TextInputType.text,
                        hintText: language.enter_your_user_name,
                        prefixIcon: SizedBox(width: width * 0.01, child: Center(
                            child: FaIcon(FontAwesomeIcons.telegram,))),
                      ),
                      SizedBox(height: height * 0.01),
                      CustomEditProfileContainer(),
                      SizedBox(height: height * 0.01),
                      CustomElevatedButton(
                        onClick: () {
                          //todo update profile
                          if (_formKey.currentState?.validate() == true) {
                            var updatedUser = MyUserDto(id: user.id,
                                numberOfSharedItem: user.numberOfSharedItem,
                                email: user.email,
                                fullName: nameController.text,
                                mobilNumber: phoneController.text,
                                userName: teleUserNameController.text);
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
