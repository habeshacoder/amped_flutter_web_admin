import 'package:flutter/material.dart';
import 'package:the_basics/widgets/navigation_bar/navbar_logo.dart';

class NavigationbarMobile extends StatelessWidget {
  const NavigationbarMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu)),
          NavbarLogo()
        ],
      ),
    );
  }
}
