import 'package:flutter/cupertino.dart';

import '../../../../network/model/my_user_dto.dart';

abstract class AuthRemoteDataSource {
  Future<MyUserDto> login(String email, String password, BuildContext context);

  Future<MyUserDto> register(
    String email,
    String password,
    String fullName,
    String phoneNumber,
      String userName,
      BuildContext context
  );

  Future<void> forgetPass(String email);

  Future<MyUserDto> loginWithGoogle(BuildContext context);
}
