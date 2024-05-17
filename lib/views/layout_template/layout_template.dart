import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:amped_media_admin/core/common/centered_view.dart';
import 'package:amped_media_admin/core/common/widgets/navigation_bar/navigation_bar.dart'
    as customNavbar;
import 'package:amped_media_admin/core/common/widgets/navigation_drawer/navigation_drawer.dart'
    as customDrawer;

import '../../config/router.dart';
import '../../features/home/home/home_view.dart';

class LayoutTemplate extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  LayoutTemplate() : super();

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        drawer: customDrawer.NavigationDrawer(),
        backgroundColor: Colors.white,
        body: CenteredView(
          child: Column(
            children: <Widget>[
              customNavbar.NavigationBar(),
            ],
          ),
        ),
      ),
    );
  }
}
