import 'package:flutter/material.dart';
import 'package:amped_media_admin/core/common/widgets/navigation_bar/navbar_item.dart';
import 'package:amped_media_admin/core/common/widgets/navigation_drawer/navigation_drawer_header.dart';
import 'package:amped_media_admin/extensions/hover_extensions.dart';

import '../../../../config/router.dart';

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
                    RouteNames.material,
                    isFromMobile: true,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  NavBarItem(
                    'Channel',
                    RouteNames.channel,
                    isFromMobile: true,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  NavBarItem(
                    'Report',
                    RouteNames.report,
                    isFromMobile: true,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  NavBarItem(
                    'Users',
                    RouteNames.user,
                    isFromMobile: true,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  NavBarItem(
                    'Profile',
                    RouteNames.profile,
                    isFromMobile: true,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  NavBarItem(
                    'SellerProfile',
                    RouteNames.sellerProfile,
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