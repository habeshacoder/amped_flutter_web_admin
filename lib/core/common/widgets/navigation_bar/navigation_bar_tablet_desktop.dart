import 'package:amped_media_admin/config/router.dart';
import 'package:flutter/material.dart';
import 'package:amped_media_admin/routing/route_names.dart';
import 'package:amped_media_admin/core/common/widgets/navigation_bar/navbar_item.dart';

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
    NavBarItem('Home', RouteNames.home),
    // NavBarItem('Review', reviewRoute),
    NavBarItem('Material', RouteNames.material),
    NavBarItem('Channel', RouteNames.channel),
    NavBarItem('Report', RouteNames.report),
    NavBarItem('Users', RouteNames.user),
    NavBarItem('Profile', RouteNames.profile),
    NavBarItem('SellerProfile', RouteNames.sellerProfile),
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
