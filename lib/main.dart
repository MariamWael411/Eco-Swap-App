
import 'package:eco_swap_app/core/utils/app_route.dart';
import 'package:eco_swap_app/core/utils/app_theme.dart';
import 'package:eco_swap_app/cubit/language_cubit.dart';
import 'package:eco_swap_app/cubit/theme_cubit.dart';
import 'package:eco_swap_app/features/home/home_screen.dart';
import 'package:eco_swap_app/features/onBoarding/onBoarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/di.dart';
import 'features/auth/ui/forget_password/forget_pass_screen.dart';
import 'features/auth/ui/login/login_screen.dart';
import 'features/auth/ui/register/register_screen.dart';
import 'firebase_options.dart';
import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
                initialRoute: AppRoute.onBoarding,
                routes: {
                  AppRoute.home: (context) => HomeScreen(),
                  AppRoute.onBoarding: (context) => OnboardingScreen(),
                  AppRoute.login: (context) => LoginScreen(),
                  AppRoute.register: (context) => RegisterScreen(),
                  AppRoute.forgetPass: (context) => ForgetPassScreen()

                },
              );
            }
        );
      },

    );
  }
}
