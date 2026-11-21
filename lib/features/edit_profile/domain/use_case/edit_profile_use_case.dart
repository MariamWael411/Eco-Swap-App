import 'package:eco_swap_app/features/edit_profile/domain/repository/edit_profile_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../network/model/my_user_dto.dart';

@lazySingleton
class EditProfileUseCase {
  EditProfileRepository _editProfileRepository;

  EditProfileUseCase({required this._editProfileRepository});

  Future<void> call(MyUserDto newUser) async {
    await _editProfileRepository.editProfile(newUser);
  }
}
