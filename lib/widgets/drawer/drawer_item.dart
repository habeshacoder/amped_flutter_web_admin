import 'package:flutter/material.dart';
import 'package:the_basics/widgets/navigation_bar/navbar_item.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({required this.icon, required this.title});
  final icon;
  final title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30, left: 60),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(
            width: 30,
          ),
          NavbarItem(title)
        ],
      ),
    );
  }
}
