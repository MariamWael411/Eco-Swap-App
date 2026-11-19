import 'package:bloc/bloc.dart';
import 'package:eco_swap_app/features/auth/domain/use_cases/register_use_case.dart';
import 'package:eco_swap_app/features/auth/ui/register/cubit/register_states.dart';
import 'package:eco_swap_app/features/utils/resource.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterCubit extends Cubit<RegisterStates> {
  final RegisterUseCase _registerUseCase;

  RegisterCubit({required this._registerUseCase})
    : super(RegisterStates.initial());

  Future<void> register(
    String email,
    String password,
    String fullName,
    String phoneNumber,
  ) async {
    emit(RegisterStates(registerStates: Resource.loading()));

    try {
      final user = await _registerUseCase(
        email,
        password,
        fullName,
        phoneNumber,
      );
      emit(RegisterStates(registerStates: Resource.success(data: user)));
    } catch (e) {
      emit(
        RegisterStates(
          registerStates: Resource.error(errorMessage: e.toString()),
        ),
      );
    }
  }
}
