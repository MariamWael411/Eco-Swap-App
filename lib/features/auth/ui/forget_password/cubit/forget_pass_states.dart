import 'package:eco_swap_app/features/utils/resource.dart';

import '../../../domain/entities/my_user.dart';

class ForgetPassStates {
  late Resource<MyUser> forgetPassStates;

  ForgetPassStates({required this.forgetPassStates});

  ForgetPassStates.initial() {
    forgetPassStates = Resource.initial();
  }
}
