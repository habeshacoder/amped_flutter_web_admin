import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:the_basics/widgets/call_to_action/calltoaction_desktop.dart';
import 'package:the_basics/widgets/call_to_action/calltoaction_mobile.dart';

class CallToAction extends StatelessWidget {
  final String title;
  CallToAction(this.title);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: CalltoactionMobile(
        title: title,
      ),
      desktop: CalltoActionDesktop(
        title: title,
      ),
    );
  }
}
