import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero/domain/cubit/settings_cubit.dart';
import 'package:hero/favorite_screen.dart';
import 'package:hero/injection.dart';
import 'package:hero/main_drawer.dart';
import 'package:hero/main_screen.dart';
import 'package:hero/nav_bar.dart';
import 'package:hero/setting_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final _screens = {
    'heroes': const MainScreen(),
    'favorite': const FavoriteScreen(),
    'settings': const SettingScreen(),
  };

  final _titles = {
    'heroes': 'Heroes',
    'favorite': 'Favorites',
    'settings': 'Settings',
  };

  String _currentScreen = 'heroes';

  void _setScreen(String identifier) async {
    setState(() {
      _currentScreen = identifier;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => inj.settingCubit..loadSettings(),
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(_titles[_currentScreen] ?? ''),
            ),
            drawer: state.useNavBar
                ? null
                : MainDrawer(
                    onSelectedScreen: _setScreen,
                  ),
            body: _screens[_currentScreen],
            bottomNavigationBar: state.useNavBar
                ? NavBar(
                    initialIndex:
                        _screens.keys.toList().indexOf(_currentScreen),
                    onTabSelected: _setScreen,
                  )
                : null,
          );
        },
      ),
    );
  }
}
