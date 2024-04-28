import 'package:flutter/material.dart';
import 'package:the_basics/widgets/drawer/drawer_item.dart';
import 'package:the_basics/widgets/drawer/naviation_drawer_header.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Column(
        children: [
          NavigationDrawerHeader(),
          DrawerItem(
            title: 'Episodes',
            icon: Icons.videocam,
          ),
          DrawerItem(
            title: 'About',
            icon: Icons.help,
          ),
        ],
      ),
    );
  }
}
