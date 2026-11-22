import 'package:eco_swap_app/features/auth/domain/entities/my_user.dart';

import '../../../network/model/my_user_dto.dart';

extension ToUser on MyUserDto {
  MyUser toMyUser() {
    return MyUser(
      id: id,
      email: email,
      fullName: fullName,
      mobilNumber: mobilNumber,
        userName: userName,
        numberOfSharedItem: numberOfSharedItem
    );
  }
}
