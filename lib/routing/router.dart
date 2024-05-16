import 'package:amped_media_admin/routing/route_names.dart';
import 'package:amped_media_admin/views/channel/channel_view.dart';
import 'package:amped_media_admin/views/home/home_view.dart';
import 'package:amped_media_admin/views/material/material_view.dart';
import 'package:amped_media_admin/views/profile/profile_view.dart';
import 'package:amped_media_admin/views/report/report_view.dart';
import 'package:amped_media_admin/views/reviews/reviews_view.dart';
import 'package:amped_media_admin/views/sellerprofile/sellerprofile_view.dart';
import 'package:amped_media_admin/views/users/user_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case channelRoute:
      return _getPageRoute(ChannelView(), settings);
    case materialRoute:
      return _getPageRoute(MaterialView(), settings);
    case reportRoute:
      return _getPageRoute(ReportView(), settings);
    case reviewRoute:
      return _getPageRoute(ReviewView(), settings);
    case UserRoute:
      return _getPageRoute(UserView(), settings);
    case materialRoute:
      return _getPageRoute(MaterialView(), settings);
    case profileRoute:
      return _getPageRoute(ProfileView(), settings);
    case sellerProfile:
      return _getPageRoute(SellerProfileView(), settings);
    default:
      return _getPageRoute(HomeView(), settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name!);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;
  _FadeRoute({required this.child, required this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
