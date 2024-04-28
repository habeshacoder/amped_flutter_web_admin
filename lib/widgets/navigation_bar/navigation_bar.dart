import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:the_basics/widgets/navigation_bar/navbar_item.dart';
import 'package:the_basics/widgets/navigation_bar/navbar_logo.dart';
import 'package:the_basics/widgets/navigation_bar/navigationbardesktop.dart';
import 'package:the_basics/widgets/navigation_bar/navigationbarmobile.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar() : super();

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: NavigationbarMobile(),
      tablet: NavigationBarDesktop(),
    );
  }
}
