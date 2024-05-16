import 'package:flutter/material.dart';
import 'package:amped_media_admin/core/constants/app_colors.dart';

class NavigationDrawerHeader extends StatelessWidget {
  const NavigationDrawerHeader() : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: primaryColor,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'MANAGE AMPED MEDIA',
            style: TextStyle(
                fontSize: 13, fontWeight: FontWeight.w800, color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'TAP HERE',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
