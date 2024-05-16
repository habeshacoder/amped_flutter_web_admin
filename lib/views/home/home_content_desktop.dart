import 'package:amped_media_admin/widgets/call_to_action/call_to_action.dart';
import 'package:amped_media_admin/widgets/course_details/course_details.dart';
import 'package:flutter/material.dart';

class HomeContentDesktop extends StatelessWidget {
  const HomeContentDesktop() : super();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CourseDetails(),
        // Expanded(
        //   child: Center(
        //     child: CallToAction('Log Out'),
        //   ),
        // )
      ],
    );
  }
}
