import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
    required this.onTabSelected,
    required this.initialIndex,
  });


  final int initialIndex;
  final void Function(String identifier) onTabSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.paddingOf(context).bottom),
        child: DefaultTabController(
          initialIndex: initialIndex,
          length: 3,
          child: TabBar(
              tabs: const [
                Tab(
                  icon: Icon(Icons.star_border),
                ),
                Tab(
                  icon: Icon(Icons.favorite_border),
                ),
                Tab(
                  icon: Icon(Icons.miscellaneous_services),
                ),
              ],
              onTap: (i) {
                switch (i) {
                  case (0):
                    onTabSelected('heroes');
                    break;
                  case (1):
                    onTabSelected('favorite');
                    break;
                  case (2):
                    onTabSelected('settings');
                    break;
                }
              }),
        ));
  }
}
