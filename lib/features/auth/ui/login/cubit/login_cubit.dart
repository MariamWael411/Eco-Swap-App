import 'package:bloc/bloc.dart';
import 'package:eco_swap_app/features/auth/domain/use_cases/login_use_case.dart';
import 'package:eco_swap_app/features/auth/ui/login/cubit/login_states.dart';
import 'package:eco_swap_app/features/utils/resource.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginCubit extends Cubit<LoginStates> {
  final LoginUseCase _loginUseCase;

  LoginCubit({required this._loginUseCase}) : super(LoginStates.initial());

  Future<void> login(String email, String password) async {
    emit(LoginStates(loginStates: Resource.loading()));

    try {
      final user = await _loginUseCase(email, password);
      emit(LoginStates(loginStates: Resource.success(data: user)));
    } catch (e) {
      emit(
        LoginStates(loginStates: Resource.error(errorMessage: e.toString())),
      );
    }
  }
}
