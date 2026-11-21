import 'package:bloc/bloc.dart';
import 'package:eco_swap_app/features/edit_profile/domain/use_case/edit_profile_use_case.dart';
import 'package:eco_swap_app/features/edit_profile/ui/cubit/edit_profile_states.dart';
import 'package:eco_swap_app/features/utils/resource.dart';
import 'package:injectable/injectable.dart';

import '../../../network/model/my_user_dto.dart';

@injectable
class EditProfileCubit extends Cubit<EditProfileStates> {
  EditProfileUseCase _editProfileUseCase;

  EditProfileCubit({required this._editProfileUseCase})
    : super(EditProfileStates.initial());

  Future<void> editProfile(MyUserDto newUser) async {
    try {
      emit(EditProfileStates(editProfileStates: Resource.loading()));
      await _editProfileUseCase(newUser);
      emit(EditProfileStates(editProfileStates: Resource.success(data: null)));
    } catch (e) {
      emit(
        EditProfileStates(
          editProfileStates: Resource.error(errorMessage: e.toString()),
        ),
      );
    }
  }
}
