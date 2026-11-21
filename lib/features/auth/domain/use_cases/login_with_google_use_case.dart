import 'package:eco_swap_app/features/auth/domain/entities/my_user.dart';
import 'package:eco_swap_app/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoginWithGoogleUseCase {
  final AuthRepository _authRepository;

  LoginWithGoogleUseCase({required this._authRepository});

  Future<MyUser> call(BuildContext context) {
    return _authRepository.loginWithGoogle(context);
  }
}
