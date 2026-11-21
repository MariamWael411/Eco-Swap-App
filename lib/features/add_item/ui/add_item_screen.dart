import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:eco_swap_app/core/di/di.dart';
import 'package:eco_swap_app/core/services/cloudinary_service.dart';
import 'package:eco_swap_app/core/services/location_service.dart';
import 'package:eco_swap_app/core/utils/validation.dart';
import 'package:eco_swap_app/cubit/my_user_cubit.dart';
import 'package:eco_swap_app/features/add_item/ui/cubit/item_cubit.dart';
import 'package:eco_swap_app/features/add_item/ui/cubit/item_states.dart';
import 'package:eco_swap_app/features/add_item/ui/widgets/custom_condition_widget.dart';
import 'package:eco_swap_app/features/add_item/ui/widgets/custom_pick_image_widget.dart';
import 'package:eco_swap_app/features/auth/ui/widget/custom_text_widget.dart';
import 'package:eco_swap_app/features/common/widgets/custom_app_bar.dart';
import 'package:eco_swap_app/features/common/widgets/custom_elevated_button.dart';
import 'package:eco_swap_app/features/common/widgets/custom_text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_config.dart';
import '../../../core/services/image_servcies.dart';
import '../../../core/utils/utils_dialog.dart';
import '../../../cubit/theme_cubit.dart';
import '../../../l10n/app_localizations.dart';
import '../../home/ui/tabs/home/model/category.dart';
import '../../home/ui/tabs/home/widgets/custom_list_view_item.dart';
import '../domain/entity/item.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  int currentIndex = 0;
  int conditionIndex = 0;
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  final _formKry = GlobalKey<FormState>();
  final _imageService = ImageService();
  File? selectedImage;
  CloudinaryService cloudinaryService = CloudinaryService();
  LocationService locationService = LocationService();
  var cubit = getIt<ItemCubit>();
  var imageUrl = "";

  @override
  Widget build(BuildContext context) {
    Category category = Category();
    category.context = context;
    var user = context
        .watch<MyUserCubit>()
        .state;
    UtilsDialog.context = context;
    UtilsDialog utilsDialog = UtilsDialog();
    Validation.context = context;
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
      appBar: customAppBar(theme, language, context, language.add_an_item),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: height * 0.03,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKry,
            child: BlocListener<ItemCubit, ItemStates>(
              bloc: cubit,
              listener: (context, state) {
                if (state.itemStates.isLoading) {
                  utilsDialog.showLoading(
                    context: context,
                    content: language.loading,
                  );
                } else if (state.itemStates.isError) {
                  utilsDialog.hideDialog(context: context);
                  utilsDialog.showMessage(
                    context: context,
                    content: state.itemStates.errorMessage ?? "",
                    title: language.error,
                    posAction: language.ok,
                  );
                } else if (state.itemStates.isSuccess) {
                  utilsDialog.hideDialog(context: context);
                  utilsDialog.showMessage(
                    context: context,
                    content: "item added successfully",
                    title: language.success,
                    posAction: language.ok,
                    posActions: () {
                      Navigator.of(context).pop();
                    },
                  );
                }
              },
              child: Column(
                spacing: height * 0.01,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    language.give_it_a_second_life,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    language.add_details_for_nearby,
                    style: theme.textTheme.displayMedium?.copyWith(
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  (selectedImage == null)
                      ? DottedBorder(
                    options: RoundedRectDottedBorderOptions(
                      strokeWidth: 1.5,
                      dashPattern: [5, 2],
                      color: theme.colorScheme.onSurface,
                      radius: Radius.circular(19),
                    ),
                    child: GestureDetector(
                      onTap: () async {
                        final file = await _imageService.pickImage(
                          context,
                        );
                        if (file != null)
                          setState(() => selectedImage = file);
                        imageUrl = await cloudinaryService
                            .uploadImage(selectedImage!);
                      },
                      child: CustomPickImageWidget(),
                    ),
                  )
                      : ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(20),
                    child: Image.file(
                      selectedImage!,
                      width: double.infinity,
                      height: height * 0.25,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  CustomTextWidget(text: language.item_title),
                  CustomTextFormFeild(
                    hintText: language.wooden_side_table_example,
                    controller: titleController,
                    onValidator: (text) {
                      return Validation.validateInput(text);
                    },
                  ),
                  SizedBox(height: height * 0.01),
                  CustomTextWidget(text: language.description),
                  CustomTextFormFeild(
                    controller: descriptionController,
                    onValidator: (text) {
                      return Validation.validateInput(text);
                    },
                    maxLength: 300,
                    hintText: language.condition_size_included,
                    maxLines: 5,
                  ),
                  CustomTextWidget(text: language.category),
                  SizedBox(
                    height: height * 0.041,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            currentIndex = index;
                            setState(() {});
                          },
                          child: CustomListViewItem(
                            index: index + 1,
                            isActive: currentIndex == index,
                          ),
                        );
                      },
                      itemCount: 4,
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  CustomTextWidget(text: language.condition),
                  SizedBox(
                    height: height * 0.041,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            conditionIndex = index;
                            setState(() {});
                          },
                          child: CustomConditionWidget(
                            conditions: conditions,
                            index: index,
                            isActive: conditionIndex == index,
                          ),
                        );
                      },
                      itemCount: 3,
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  CustomElevatedButton(
                    onClick: () async {
                      //todo add item to firebase
                      final position = await locationService
                          .getCurrentLocation();

                      final latitude = position.latitude;
                      final longitude = position.longitude;

                      Item item = Item(
                        categoryIndex: currentIndex,
                        conditionIndex: conditionIndex,
                        description: descriptionController.text,
                        title: titleController.text,
                        latitude: latitude,
                        longitude: longitude,
                        status: "Available",
                        userId: user.id,
                        imageUrl: imageUrl,
                      );
                      if (_formKry.currentState?.validate() == true) {
                        cubit.addItem(item);
                      }
                    },
                    text: language.publish_item,
                  ),
                  SizedBox(height: height * 0.01),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
