import 'package:amped_media_admin/widgets/call_to_action/call_to_action.dart';
import 'package:amped_media_admin/widgets/course_details/course_details.dart';
import 'package:flutter/material.dart';

class HomeContentMobile extends StatelessWidget {
  const HomeContentMobile() : super();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CourseDetails(),
          SizedBox(
            height: 100,
          ),
          // CallToAction('Log Out'),
        ],
      ),
    );
  }
}
