import '../../../../network/model/my_user_dto.dart';

abstract class EditProfileRemoteDataSource {
  Future<void> editProfile(MyUserDto newUser);
}
