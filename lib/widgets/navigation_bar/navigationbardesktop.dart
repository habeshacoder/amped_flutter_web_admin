import 'package:flutter/material.dart';
import 'package:the_basics/widgets/navigation_bar/navbar_item.dart';
import 'package:the_basics/widgets/navigation_bar/navbar_logo.dart';

class NavigationBarDesktop extends StatelessWidget {
  const NavigationBarDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          NavbarLogo(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              NavbarItem('Episodes'),
              SizedBox(
                width: 60,
              ),
              NavbarItem('About')
            ],
          )
        ],
      ),
    );
    ;
  }
}
