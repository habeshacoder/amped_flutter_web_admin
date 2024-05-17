import 'package:amped_media_admin/features/home/home/home_view.dart';
import 'package:go_router/go_router.dart';
import '../views/layout_template/layout_template.dart';

final router = GoRouter(
  initialLocation: '/templateLayout',
  routes: [
    GoRoute(
        name: RouteNames.templayeLayout,
        path: '/templateLayout',
        builder: (context, state) {
          return LayoutTemplate();
        },
        routes: [
          GoRoute(
            name: RouteNames.home,
            path: 'home',
            builder: (context, state) {
              return HomeView();
            },
          ),
        ]),
  ],
);

class RouteNames {
  static const home = 'home';
  static const user = 'user';
  static const channel = 'channel';
  static const material = 'material';
  static const profile = 'profile';
  static const sellerProfile = 'sellerProfile';
  static const subscribedUser = 'subscribedUser';
  static const channelMaterial = 'channelMaterial';
  static const favorite = 'favorite';
  static const materialInSubscriptionPlan = 'materialInSubscriptionPlan';
  static const replay = 'replay';
  static const report = 'report';
  static const rate = 'rate';
  static const templayeLayout = 'templateLayout';
}
