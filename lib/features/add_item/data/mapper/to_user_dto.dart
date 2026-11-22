import 'package:eco_swap_app/features/auth/domain/entities/my_user.dart';
import 'package:eco_swap_app/features/network/model/my_user_dto.dart';

extension ToUserDto on MyUser {
  MyUserDto toUserDto() {
    return MyUserDto(
      id: id,
      email: email,
      fullName: fullName,
      mobilNumber: mobilNumber,
      userName: userName,
    );
  }
}
