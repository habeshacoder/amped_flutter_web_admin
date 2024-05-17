import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:amped_media_admin/styles/text_styles.dart';

class CourseDetails extends StatelessWidget {
  const CourseDetails() : super();

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        var textAlignment =
            sizingInformation.deviceScreenType == DeviceScreenType.Desktop
                ? TextAlign.left
                : TextAlign.center;
        double fontsize =
            sizingInformation.deviceScreenType == DeviceScreenType.Desktop
                ? 100
                : 50;

        return Container(
          width: 600,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'AMPED Media Admin Page',
                style: TextStyle(fontSize: fontsize),
                // style: titleTextStyle(sizingInformation.deviceScreenType),
                textAlign: textAlignment,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'you can see informations about amped media mobile app.',
                style: descriptionTextStyle(sizingInformation.deviceScreenType),
                textAlign: textAlignment,
              )
            ],
          ),
        );
      },
    );
  }
}
