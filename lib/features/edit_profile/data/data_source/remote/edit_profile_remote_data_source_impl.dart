import 'package:eco_swap_app/core/utils/firebase_utils.dart';
import 'package:eco_swap_app/features/edit_profile/data/data_source/remote/edit_profile_remote_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../../network/model/my_user_dto.dart';

@Injectable(as: EditProfileRemoteDataSource)
class EditProfileRemoteDataSourceImpl implements EditProfileRemoteDataSource {
  @override
  Future<void> editProfile(MyUserDto newUser) async {
    await FirebaseUtils.updateUser(newUser);
  }
}
