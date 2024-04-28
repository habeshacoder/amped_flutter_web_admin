import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:the_basics/views/home/home_view_desktop.dart';
import 'package:the_basics/views/home/home_view_mobile.dart';
import 'package:the_basics/widgets/call_to_action/call_to_action.dart';
import 'package:the_basics/widgets/centered_view/centered_view.dart';
import 'package:the_basics/widgets/course_details/course_details.dart';
import 'package:the_basics/widgets/drawer/bavigationdrawer.dart'
    as customdrawer;
import 'package:the_basics/widgets/navigation_bar/navigation_bar.dart'
    as CustomBar;

class HomeView extends StatelessWidget {
  const HomeView() : super();

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Scaffold(
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text(
                    'Drawer Header',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                  onTap: () {
                    // navigate to the home screen
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  onTap: () {
                    // navigate to the settings screen
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          backgroundColor: Colors.white,
          body: CenteredView(
            child: Column(
              children: [
                CustomBar.NavigationBar(),
                Expanded(
                    child: ScreenTypeLayout(
                  mobile: HOmeViewMobile(),
                  desktop: HomeViewDesktop(),
                ))
              ],
            ),
          ),
        );
      },
    );
  }
}
