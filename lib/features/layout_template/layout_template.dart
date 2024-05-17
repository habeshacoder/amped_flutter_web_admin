import 'package:amped_media_admin/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:amped_media_admin/core/common/widgets/navigation_bar/navigation_bar.dart'
    as customNavbar;
import 'package:amped_media_admin/core/common/widgets/navigation_drawer/navigation_drawer.dart'
    as customDrawer;

import '../../config/router.dart';
import '../../core/common/centered_view.dart';

class LayoutTemplate extends StatelessWidget {
  const LayoutTemplate() : super();

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
              Expanded(
                child: Navigator(
                  key: serviceLocator<NavigationService>().navigatorKey,
                  onGenerateRoute: generateRoute,
                  initialRoute: RouteNames.home,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
