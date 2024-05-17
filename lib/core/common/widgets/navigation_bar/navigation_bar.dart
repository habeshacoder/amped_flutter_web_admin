import 'package:flutter/material.dart';
import 'package:amped_media_admin/core/common/widgets/navigation_bar/navigation_bar_tablet_desktop.dart';
import 'package:amped_media_admin/core/common/widgets/navigation_bar/navigation_bar_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:amped_media_admin/extensions/hover_extensions.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar() : super();

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: NavigationBarMobile(),
      desktop: NavigationBarTabletDesktop(),
      // tablet: NavigationBarMobile(),
    ).showCursorOnHover;
  }
}
