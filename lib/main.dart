


import 'package:eco_swap_app/core/utils/app_theme.dart';
import 'package:eco_swap_app/cubit/language_cubit.dart';
import 'package:eco_swap_app/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'l10n/app_localizations.dart';

void main(){

  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: ((context) => LanguageCubit())),
    BlocProvider(create: ((context) => ThemeCubit())),

  ],
  child: MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<LanguageCubit,Locale>(
      builder: (BuildContext context, languageState) {
        return BlocBuilder<ThemeCubit,ThemeMode>(
            builder: (context,themeState){
              return MaterialApp(
                locale: languageState,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: themeState,
                debugShowCheckedModeBanner: false,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
              );
            }
        );
      },

    );
  }
}
