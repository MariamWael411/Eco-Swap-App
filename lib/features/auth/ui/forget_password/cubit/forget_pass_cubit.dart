import 'package:bloc/bloc.dart';
import 'package:eco_swap_app/features/auth/domain/use_cases/forget_pass_use_case.dart';
import 'package:eco_swap_app/features/auth/ui/forget_password/cubit/forget_pass_states.dart';
import 'package:eco_swap_app/features/utils/resource.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgetPassCubit extends Cubit<ForgetPassStates> {
  final ForgetPassUseCase _forgetPassUseCase;

  ForgetPassCubit({required this._forgetPassUseCase})
    : super(ForgetPassStates.initial());

  Future<void> forgetPass(String email) async {
    emit(ForgetPassStates(forgetPassStates: Resource.loading()));

    try {
      final user = await _forgetPassUseCase(email);
      emit(ForgetPassStates(forgetPassStates: Resource.success(data: null)));
    } catch (e) {
      emit(
        ForgetPassStates(
          forgetPassStates: Resource.error(errorMessage: e.toString()),
        ),
      );
    }
  }
}
