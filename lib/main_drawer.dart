import 'package:flutter/material.dart';
import 'package:hero/drawer_item.dart';

class MainDrawer extends StatelessWidget {
  MainDrawer({super.key, required this.onSelectedScreen});

  final void Function(String identifier) onSelectedScreen;

  final items = {
    'heroes': 'Heroes',
    'favorite': 'Favorites',
    'settings': 'Settings',
  };

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          const Row(
            children: [
              Icon(
                Icons.star,
                color: Color.fromARGB(255, 101, 5, 5),
                size: 40,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                'Menu',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ],
          ),
          ...items.entries.map(
            (e) => DrawerItem(
              e.value,
              e.key,
              onSelectedScreen: onSelectedScreen,
            ),
          ),
        ],
      ),
    );
  }
}
