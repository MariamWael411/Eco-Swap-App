import '../../../utils/resource.dart';

class EditProfileStates {
  late Resource<void> editProfileStates;

  EditProfileStates({required this.editProfileStates});

  EditProfileStates.initial() {
    editProfileStates = Resource.initial();
  }
}
