import 'package:eco_swap_app/features/edit_profile/data/data_source/remote/edit_profile_remote_data_source.dart';
import 'package:eco_swap_app/features/edit_profile/domain/repository/edit_profile_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../network/model/my_user_dto.dart';

@Injectable(as: EditProfileRepository)
class EditProfileRepositoryImpl implements EditProfileRepository {
  EditProfileRemoteDataSource _editProfileRemoteDataSource;

  EditProfileRepositoryImpl({required this._editProfileRemoteDataSource});

  @override
  Future<void> editProfile(MyUserDto newUser) async {
    try {
      await _editProfileRemoteDataSource.editProfile(newUser);
    } catch (e) {
      rethrow;
    }
  }
}
