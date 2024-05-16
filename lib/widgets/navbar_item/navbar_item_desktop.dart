import 'package:flutter/material.dart';
import 'package:amped_media_admin/routing/route_names.dart';
import 'package:amped_media_admin/widgets/navbar_item/navbar_item.dart';

class NavBarItemTabletDesktop {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: [
          NavBarItem('Material', materialRoute),
          SizedBox(
            width: 60,
          ),
          NavBarItem('Channel', channelRoute),
          SizedBox(
            width: 60,
          ),
          NavBarItem('Report', reportRoute),
          SizedBox(
            width: 60,
          ),
          NavBarItem('Users', UserRoute),
          SizedBox(
            width: 60,
          ),
          NavBarItem('Profile', profileRoute),
          SizedBox(
            width: 60,
          ),
          NavBarItem('SellerProfile', sellerProfile),
          SizedBox(
            width: 60,
          ),
        ],
      ),
    );
  }
}
