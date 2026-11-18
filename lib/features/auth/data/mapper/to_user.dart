import 'package:eco_swap_app/features/auth/data/model/my_user_dto.dart';
import 'package:eco_swap_app/features/auth/domain/entities/my_user.dart';

extension ToUser on MyUserDto {
  MyUser toMyUser() {
    return MyUser(
      id: id,
      email: email,
      fullName: fullName,
      mobilNumber: mobilNumber,
    );
  }
}
