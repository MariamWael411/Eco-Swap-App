import 'package:eco_swap_app/features/utils/resource.dart';

import '../../../domain/entities/my_user.dart';

class LoginWithGoogleStates {
  late Resource<MyUser> loginWithGoogleStates;

  LoginWithGoogleStates({required this.loginWithGoogleStates});

  LoginWithGoogleStates.initial() {
    loginWithGoogleStates = Resource.initial();
  }
}
