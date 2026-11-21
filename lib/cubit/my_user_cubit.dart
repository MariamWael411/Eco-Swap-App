import 'package:bloc/bloc.dart';

import '../features/network/model/my_user_dto.dart';

class MyUserCubit extends Cubit<MyUserDto> {
  MyUserCubit()
    : super(MyUserDto(id: '', email: '', fullName: '', mobilNumber: ''));

  void changeUser(MyUserDto newUser) {
    emit(newUser);
  }
}
