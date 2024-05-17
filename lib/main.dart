import 'package:amped_media_admin/init_dependencies.dart';
import 'package:amped_media_admin/features/layout_template/layout_template.dart';
import 'package:flutter/material.dart';

void main() {
  // setupLocator();
  initDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AMPED Media Admin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Open Sans'),
      ),
      home: LayoutTemplate(),
    );
  }
}
