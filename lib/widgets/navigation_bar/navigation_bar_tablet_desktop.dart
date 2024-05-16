import 'package:flutter/material.dart';
import 'package:amped_media_admin/routing/route_names.dart';
import 'package:amped_media_admin/widgets/navbar_item/navbar_item.dart';

import 'navbar_logo.dart';

class NavigationBarTabletDesktop extends StatefulWidget {
  const NavigationBarTabletDesktop() : super();

  @override
  State<NavigationBarTabletDesktop> createState() =>
      _NavigationBarTabletDesktopState();
}

class _NavigationBarTabletDesktopState
    extends State<NavigationBarTabletDesktop> {
  int activeIndex = -1; // Initialize active index

  final navbarItem = [
    NavBarLogo(),
    NavBarItem('Home', HomeRoute),
    // NavBarItem('Review', reviewRoute),
    NavBarItem('Material', materialRoute),
    NavBarItem('Channel', channelRoute),
    NavBarItem('Report', reportRoute),
    NavBarItem('Users', UserRoute),
    NavBarItem('Profile', profileRoute),
    NavBarItem('SellerProfile', sellerProfile),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: navbarItem.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              activeIndex =
                  index; // Update active index when a button is tapped
            });
            print(
              '/////////////////////////////////////$activeIndex',
            );
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: navbarItem[index],
            decoration: BoxDecoration(
              color: index == activeIndex
                  ? Colors.blue
                  : null, // Apply color to the active button
            ),
          ),
        ),
      ),
    );
  }
}
