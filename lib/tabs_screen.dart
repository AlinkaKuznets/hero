import 'package:flutter/material.dart';
import 'package:hero/favorite_screen.dart';
import 'package:hero/main_drawer.dart';
import 'package:hero/main_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final _screens = {
    'heroes': MainScreen(),
    'favorite': FavoriteScreen(),
  };

  final _titles = {
    'heroes': 'Heroes',
    'favorite': 'Favorites',
  };

  String _currentScreen = 'heroes';

  void _setScreen(String identifier) async {
    setState(() {
      _currentScreen = identifier;
    });
    // Navigator.of(context).pop();
    // if (identifier == 'favorite') {
    //   await Navigator.of(context).push<HeroClass>(
    //       MaterialPageRoute(builder: (ctx) =>  FavoriteScreen(id: id,)),);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentScreen] ?? ''),
      ),
      drawer: MainDrawer(
        onSelectedScreen: _setScreen,
      ),
      body: _screens[_currentScreen],
    );
  }
}
