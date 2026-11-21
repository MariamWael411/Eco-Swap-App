import '../../../network/model/my_user_dto.dart';

abstract class EditProfileRepository {
  Future<void> editProfile(MyUserDto newUser);
}
