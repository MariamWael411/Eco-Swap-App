import 'package:eco_swap_app/features/auth/domain/entities/my_user.dart';
import 'package:flutter/cupertino.dart';

abstract class AuthRepository {
  Future<MyUser> login(String email, String password, BuildContext context);

  Future<MyUser> register(
    String email,
    String password,
    String fullName,
    String phoneNumber,
      String userName,
      BuildContext context
  );

  Future<MyUser> loginWithGoogle(BuildContext context);

  Future<void> forgetPass(String email);
}
