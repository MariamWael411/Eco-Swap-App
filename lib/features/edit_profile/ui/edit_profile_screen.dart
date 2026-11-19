import 'package:eco_swap_app/features/common/widgets/custom_app_bar.dart';
import 'package:eco_swap_app/features/common/widgets/custom_elevated_button.dart';
import 'package:eco_swap_app/features/edit_profile/ui/widgets/custom_edit_profile_container.dart';
import 'package:eco_swap_app/features/home/ui/tabs/profile/widget/custom_name_widget.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_config.dart';
import '../../../core/utils/validation.dart';
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

  @override
  Widget build(BuildContext context) {
    Validation.context = context;
    var width = AppConfig.width(context);
    var height = AppConfig.height(context);
    var theme = Theme.of(context);
    var language = AppLocalizations.of(context)!;

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
              CustomNameWidget(),
              Form(
                key: _formKey,
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
                        if (_formKey.currentState?.validate() == true) {}
                      },
                      text: language.save_changes,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
