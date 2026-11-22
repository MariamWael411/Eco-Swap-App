import 'package:eco_swap_app/features/auth/domain/entities/my_user.dart';
import 'package:eco_swap_app/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RegisterUseCase {
  final AuthRepository _authRepository;

  RegisterUseCase({required this._authRepository});

  Future<MyUser> call(
    String email,
    String password,
    String fullName,
    String phoneNumber,
      String userName,
      BuildContext context
  ) {
    return _authRepository.register(
        email, password, fullName, phoneNumber, userName, context);
  }
}
