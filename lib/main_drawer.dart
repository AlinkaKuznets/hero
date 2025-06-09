import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectedScreen});

  final void Function(String identifier) onSelectedScreen;

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
          ListTile(
            title: const Text(
              'Heroes',
              style: TextStyle(
                fontSize: 26,
              ),
            ),
            onTap: () {
              onSelectedScreen('heroes');
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text(
              'Favorites',
              style: TextStyle(
                fontSize: 26,
              ),
            ),
            onTap: () {
              onSelectedScreen('favorite');
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text(
              'Settings',
              style: TextStyle(
                fontSize: 26,
              ),
            ),
            onTap: () {
              onSelectedScreen('settings');
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
