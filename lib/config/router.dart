import 'package:amped_media_admin/features/channelmaterial/presentation/pages/channelmaterial_view.dart';
import 'package:amped_media_admin/features/home/home/home_view.dart';
import 'package:amped_media_admin/features/material/presentation/pages/material_view.dart';
import 'package:amped_media_admin/features/report/presentation/pages/report_view.dart';
import 'package:amped_media_admin/features/review_rate/presentation/pages/rate_view.dart';
import 'package:flutter/material.dart';
import '../features/channel/presentation/pages/channel_view.dart';
import '../features/profile/presentation/pages/profile_view.dart';
import '../features/replays/presentation/pages/replay_view.dart';
import '../features/sellerprofile/presentation/pages/sellerprofile_view.dart';
import '../features/subscriptionplan/presentation/pages/subscriptionplan_view.dart';
import '../features/user/presentation/pages/user_view.dart';

class RouteNames {
  static const home = '/home';
  static const user = '/user';
  static const channel = '/channel';
  static const material = '/material';
  static const profile = '/profile';
  static const sellerProfile = '/sellerProfile';
  static const subscribedUser = '/subscribedUser';
  static const channelMaterial = '/channelMaterial';
  static const favorite = '/favorite';
  static const materialInSubscriptionPlan = '/materialInSubscriptionPlan';
  static const replay = '/replay';
  static const report = '/report';
  static const rate = '/rate';
  static const subscriptionPlan = '/subscriptionPlan';
  static const templayeLayout = '/templateLayout';
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RouteNames.channel:
      return _getPageRoute(ChannelView(), settings);
    case RouteNames.material:
      return _getPageRoute(MaterialView(), settings);
    case RouteNames.report:
      return _getPageRoute(ReportView(), settings);
    case RouteNames.user:
      return _getPageRoute(UserView(), settings);
    case RouteNames.profile:
      return _getPageRoute(ProfileView(), settings);
    case RouteNames.sellerProfile:
      return _getPageRoute(SellerProfileView(), settings);
    case RouteNames.channelMaterial:
      return _getPageRoute(ChannelMaterialView(), settings);
    case RouteNames.subscriptionPlan:
      return _getPageRoute(SubscriptionPlanView(), settings);
    case RouteNames.replay:
      return _getPageRoute(ReplayView(), settings);
    case RouteNames.rate:
      return _getPageRoute(RateView(), settings);

    default:
      return _getPageRoute(HomeView(), settings);
  }
}

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  dynamic goBack() {
    return navigatorKey.currentState!.pop();
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
