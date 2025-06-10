import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero/domain/cubit/settings_cubit.dart';
import 'package:hero/injection.dart';
import 'package:hero/tabs_screen.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 251, 216, 216));
var darkColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 32, 88, 63));

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
            textTheme: const TextTheme(
                labelLarge: TextStyle(
                  color: Color.fromARGB(255, 101, 5, 5),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
                bodyMedium: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
                headlineMedium: TextStyle(
                  color: Color.fromARGB(255, 101, 5, 5),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                )),
          ),
          darkTheme: ThemeData.dark().copyWith(
            colorScheme: darkColorScheme,
            textTheme: const TextTheme(
              labelLarge: TextStyle(
                color: Color.fromARGB(255, 45, 125, 89),
                fontSize: 18,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
              headlineMedium: TextStyle(
                color: Color.fromARGB(255, 45, 125, 89),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            cardTheme: const CardTheme(
              color: Color.fromARGB(255, 42, 42, 42),
            ),
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
            ),
            switchTheme: const SwitchThemeData(
              trackColor: WidgetStatePropertyAll(Colors.white),
              thumbColor: WidgetStatePropertyAll(
                Color.fromARGB(255, 45, 125, 89),
              ),
            ),
          ),
        );
      },
    );
  }
}
