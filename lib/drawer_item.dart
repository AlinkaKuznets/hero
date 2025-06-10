import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final String value;

  const DrawerItem(
    this.title,
    this.value, {
    super.key,
    required this.onSelectedScreen,
  });

  final void Function(String identifier) onSelectedScreen;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 26,
        ),
      ),
      onTap: () {
        onSelectedScreen(value);
        Navigator.of(context).pop();
      },
    );
  }
}
