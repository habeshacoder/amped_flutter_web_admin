import 'package:flutter/material.dart';

class NavbarItem extends StatelessWidget {
  const NavbarItem(this.title);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 18),
    );
  }
}
