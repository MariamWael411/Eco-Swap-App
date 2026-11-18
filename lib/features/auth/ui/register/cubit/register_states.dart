import 'package:eco_swap_app/features/utils/resource.dart';

import '../../../domain/entities/my_user.dart';

class RegisterStates {
  late Resource<MyUser> registerStates;

  RegisterStates({required this.registerStates});

  RegisterStates.initial() {
    registerStates = Resource.initial();
  }
}
