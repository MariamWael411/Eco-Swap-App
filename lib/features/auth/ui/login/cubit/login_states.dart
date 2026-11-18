import 'package:eco_swap_app/features/utils/resource.dart';

import '../../../domain/entities/my_user.dart';

class LoginStates {
  late Resource<MyUser> loginStates;

  LoginStates({required this.loginStates});

  LoginStates.initial() {
    loginStates = Resource.initial();
  }
}
