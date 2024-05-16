import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:amped_media_admin/locator.dart';
import 'package:amped_media_admin/routing/route_names.dart';
import 'package:amped_media_admin/routing/router.dart';
import 'package:amped_media_admin/services/navigation_service.dart';
import 'package:amped_media_admin/widgets/centered_view/centered_view.dart';
import 'package:amped_media_admin/widgets/navigation_bar/navigation_bar.dart';
import 'package:amped_media_admin/widgets/navigation_bar/navigation_bar.dart'
    as customNavbar;
import 'package:amped_media_admin/widgets/navigation_drawer/navigation_drawer.dart'
    as customDrawer;

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
                  key: locator<NavigationService>().navigatorKey,
                  onGenerateRoute: generateRoute,
                  initialRoute: welcomepaageRoute,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
