import 'package:flutter/material.dart';
import 'package:the_basics/widgets/call_to_action/call_to_action.dart';
import 'package:the_basics/widgets/course_details/course_details.dart';

class HOmeViewMobile extends StatelessWidget {
  const HOmeViewMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        // mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),
          CourseDetails(),
          SizedBox(
            height: 100,
          ),
          Center(
            child: CallToAction('Join Course'),
          ),
        ],
      ),
    );
  }
}
