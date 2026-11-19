import 'package:bloc/bloc.dart';
import 'package:eco_swap_app/features/auth/domain/use_cases/login_with_google_use_case.dart';
import 'package:eco_swap_app/features/auth/ui/common/cubit/login_with_google_states.dart';
import 'package:eco_swap_app/features/utils/resource.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginWithGoogleCubit extends Cubit<LoginWithGoogleStates> {
  final LoginWithGoogleUseCase _loginWithGoogleUseCase;

  LoginWithGoogleCubit({required this._loginWithGoogleUseCase})
    : super(LoginWithGoogleStates.initial());

  Future<void> loginWithGoogle() async {
    emit(LoginWithGoogleStates(loginWithGoogleStates: Resource.loading()));

    try {
      final user = await _loginWithGoogleUseCase();
      emit(
        LoginWithGoogleStates(
          loginWithGoogleStates: Resource.success(data: user),
        ),
      );
    } catch (e) {
      emit(
        LoginWithGoogleStates(
          loginWithGoogleStates: Resource.error(errorMessage: e.toString()),
        ),
      );
    }
  }
}
