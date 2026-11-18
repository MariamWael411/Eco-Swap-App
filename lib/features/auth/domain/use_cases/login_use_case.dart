import 'package:eco_swap_app/features/auth/domain/entities/my_user.dart';
import 'package:eco_swap_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCase({required this._authRepository});

  Future<MyUser> call(String email, String password) {
    return _authRepository.login(email, password);
  }
}
