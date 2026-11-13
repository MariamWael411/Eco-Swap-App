import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light);

  void changeLanguage(ThemeMode newTheme) {
    emit(newTheme);
  }

  bool isDark(){
    return state==ThemeMode.dark;
  }
}
