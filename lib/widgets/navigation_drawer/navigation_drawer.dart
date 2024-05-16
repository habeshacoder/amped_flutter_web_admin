import 'package:flutter/material.dart';
import 'package:amped_media_admin/routing/route_names.dart';
import 'package:amped_media_admin/widgets/navbar_item/navbar_item.dart';
import 'package:amped_media_admin/widgets/navigation_drawer/navigation_drawer_header.dart';
import 'package:amped_media_admin/extensions/hover_extensions.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer() : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 16),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            NavigationDrawerHeader(),
            Padding(
              padding: EdgeInsets.only(left: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // NavBarItem(
                  //   'Review',
                  //   reviewRoute,
                  //   isFromMobile: true,
                  // ),
                  SizedBox(
                    height: 40,
                  ),
                  NavBarItem(
                    'Material',
                    materialRoute,
                    isFromMobile: true,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  NavBarItem(
                    'Channel',
                    channelRoute,
                    isFromMobile: true,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  NavBarItem(
                    'Report',
                    reportRoute,
                    isFromMobile: true,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  NavBarItem(
                    'Users',
                    UserRoute,
                    isFromMobile: true,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  NavBarItem(
                    'Profile',
                    profileRoute,
                    isFromMobile: true,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  NavBarItem(
                    'SellerProfile',
                    sellerProfile,
                    isFromMobile: true,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ).showCursorOnHover,
            )
          ],
        ),
      ),
    );
  }
}
