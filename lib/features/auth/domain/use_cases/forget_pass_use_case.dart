import 'package:eco_swap_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ForgetPassUseCase {
  final AuthRepository _authRepository;

  ForgetPassUseCase({required this._authRepository});

  Future<void> call(String email) {
    return _authRepository.forgetPass(email);
  }
}
