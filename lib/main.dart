import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero/domain/cubit/settings_cubit.dart';
import 'package:hero/injection.dart';
import 'package:hero/tabs_screen.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 251, 216, 216));

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => inj.favoriteCubit..loadData(),
        ),
        BlocProvider(
          create: (context) => inj.settingCubit..loadSettings(),
        ),
      ],
      child: const HeroApp(),
    ),
  );
}

class HeroApp extends StatelessWidget {
  const HeroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return MaterialApp(
          home: const TabsScreen(),
          themeMode: state.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          theme: ThemeData.light().copyWith(
            colorScheme: kColorScheme,
            appBarTheme: const AppBarTheme(
              backgroundColor: Color.fromARGB(255, 101, 5, 5),
              foregroundColor: Color.fromARGB(255, 251, 216, 216),
            ),
          ),
          darkTheme: ThemeData.dark().copyWith(
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
