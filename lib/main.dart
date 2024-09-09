import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero/injection.dart';
import 'package:hero/tabs_screen.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 251, 216, 216));

void main() {
  runApp(
    BlocProvider(
      create: (context) => inj.favoriteCubit..loadData(),
      child: MaterialApp(
        home: const TabsScreen(),
        theme: ThemeData.light().copyWith(
          colorScheme: kColorScheme,
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 101, 5, 5),
            foregroundColor: Color.fromARGB(255, 251, 216, 216),
          ),
        ),
      ),
    ),
  );
}
