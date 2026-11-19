import 'package:eco_swap_app/features/auth/domain/entities/my_user.dart';

abstract class AuthRepository {
  Future<MyUser> login(String email, String password);

  Future<MyUser> register(
    String email,
    String password,
    String fullName,
    String phoneNumber,
  );

  Future<MyUser> loginWithGoogle();

  Future<void> forgetPass(String email);
}
