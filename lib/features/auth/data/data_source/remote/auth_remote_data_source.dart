import 'package:eco_swap_app/features/auth/data/model/my_user_dto.dart';

abstract class AuthRemoteDataSource {
  Future<MyUserDto> login(String email, String password);

  Future<MyUserDto> register(
    String email,
    String password,
    String fullName,
    String phoneNumber,
  );

  Future<void> forgetPass(String email);

  Future<MyUserDto> loginWithGoogle();
}
