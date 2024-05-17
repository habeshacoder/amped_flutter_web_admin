import 'package:amped_media_admin/config/router.dart';
import 'package:amped_media_admin/init_dependencies.dart';
import 'package:amped_media_admin/provider/auth.dart';
import 'package:amped_media_admin/provider/channelprovider.dart';
import 'package:amped_media_admin/provider/materialprovider.dart';
import 'package:amped_media_admin/provider/profileprovider.dart';
import 'package:amped_media_admin/provider/reportprovider.dart';
import 'package:amped_media_admin/provider/sellerprofileprovider.dart';
import 'package:amped_media_admin/provider/userprovider.dart';
import 'package:amped_media_admin/views/layout_template/layout_template.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  // setupLocator();
  initDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ChannelCreationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => materialCreationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Auth(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SellerProfileProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ReportProvider(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'AMPED Media Admin',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Open Sans'),
        ),
        routerConfig: router,
        // home: LayoutTemplate(),
      ),
    );
  }
}
