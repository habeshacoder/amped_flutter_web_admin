import 'package:flutter/material.dart';
import 'package:amped_media_admin/datamodels/navbar_item_model.dart';

class NavBarItemMobile {
  NavBarItemMobile({required this.icon, required this.ttle});
  final icon;
  final ttle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 60),
      child: Row(
        children: <Widget>[
          Icon(icon),
          SizedBox(
            width: 30,
          ),
          Text(
            ttle,
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }
}
