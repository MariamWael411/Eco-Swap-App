import 'package:eco_swap_app/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:eco_swap_app/features/auth/data/mapper/to_user.dart';
import 'package:eco_swap_app/features/auth/domain/entities/my_user.dart';
import 'package:eco_swap_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl({required this._authRemoteDataSource});

  @override
  Future<void> forgetPass(String email) async {
    try {
      await _authRemoteDataSource.forgetPass(email);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MyUser> login(String email, String password) async {
    try {
      final user = await _authRemoteDataSource.login(email, password);
      return user.toMyUser();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MyUser> loginWithGoogle() async {
    try {
      final user = await _authRemoteDataSource.loginWithGoogle();
      return user.toMyUser();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MyUser> register(
    String email,
    String password,
    String fullName,
    String phoneNumber,
  ) async {
    try {
      final userDto = await _authRemoteDataSource.register(
        email,
        password,
        fullName,
        phoneNumber,
      );
      return userDto.toMyUser();
    } catch (e) {
      rethrow;
    }
  }
}
