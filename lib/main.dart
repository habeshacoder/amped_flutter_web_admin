import 'package:amped_media_admin/config/router.dart';
import 'package:amped_media_admin/features/channel/data/datasources/channel_remote_datasource.dart';
import 'package:amped_media_admin/features/channel/data/repositories/channel_repository_impl.dart';
import 'package:amped_media_admin/features/channel/domain/usecases/delete_channel.dart';
import 'package:amped_media_admin/features/channel/domain/usecases/get_all_channels.dart';
import 'package:amped_media_admin/features/channel/domain/usecases/search_channel.dart';
import 'package:amped_media_admin/features/channel/presentation/bloc/allchannels_bloc.dart';
import 'package:amped_media_admin/init_dependencies.dart';
import 'package:amped_media_admin/features/layout_template/layout_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  // setupLocator();
  initDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ChannelBloc(
              getAllChannels: GetAllChannels(
                channelRepository: ChannelRepositoryImpl(
                  channelRemoteDataSource: ChannelRemoteDataSourceImpl(),
                ),
              ),
              deleteChannel: DeleteChannel(
                channelRepository: ChannelRepositoryImpl(
                  channelRemoteDataSource: ChannelRemoteDataSourceImpl(),
                ),
              ),
              searchChannel: SearchChannel(
                channelRepository: ChannelRepositoryImpl(
                  channelRemoteDataSource: ChannelRemoteDataSourceImpl(),
                ),
              )),
        )
      ],
      child: MyApp(),
    ),
  );
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
      builder: (context, child) => LayoutTemplate(
        child: child,
      ),
      navigatorKey: serviceLocator<NavigationService>().navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: RouteNames.home,
    );
  }
}
