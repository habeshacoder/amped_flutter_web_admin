import 'package:amped_media_admin/config/router.dart';
import 'package:amped_media_admin/features/channel/data/datasources/channel_remote_datasource.dart';
import 'package:amped_media_admin/features/channel/data/repositories/channel_repository_impl.dart';
import 'package:amped_media_admin/features/channel/domain/usecases/delete_channel.dart';
import 'package:amped_media_admin/features/channel/domain/usecases/get_all_channels.dart';
import 'package:amped_media_admin/features/channel/domain/usecases/search_channel.dart';
import 'package:amped_media_admin/features/channel/presentation/bloc/allchannels_bloc.dart';
import 'package:amped_media_admin/features/material/data/datasources/material_remote_data_source.dart';
import 'package:amped_media_admin/features/material/data/repositories/material_repository_impl.dart';
import 'package:amped_media_admin/features/material/domain/usecases/delete_material.dart';
import 'package:amped_media_admin/features/material/domain/usecases/get_all_materials.dart';
import 'package:amped_media_admin/features/material/domain/usecases/search_material.dart';
import 'package:amped_media_admin/features/profile/data/datasource/profile_remote_data_source.dart';
import 'package:amped_media_admin/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:amped_media_admin/features/profile/domain/usecases/delete_profile.dart';
import 'package:amped_media_admin/features/profile/domain/usecases/get_all_profile.dart';
import 'package:amped_media_admin/features/profile/domain/usecases/search_profile.dart';
import 'package:amped_media_admin/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:amped_media_admin/features/user/data/datasources/user_remote_data_source.dart';
import 'package:amped_media_admin/features/user/data/repositories/user_repository_impl.dart';
import 'package:amped_media_admin/features/user/domain/usecases/delete_user.dart';
import 'package:amped_media_admin/features/user/domain/usecases/get_all_user.dart';
import 'package:amped_media_admin/features/user/domain/usecases/search_user.dart';
import 'package:amped_media_admin/features/user/presentation/bloc/user_bloc.dart';
import 'package:amped_media_admin/init_dependencies.dart';
import 'package:amped_media_admin/features/layout_template/layout_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/material/presentation/bloc/material_bloc.dart';

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
        ),
        BlocProvider(
          create: (context) => MaterialBloc(
            getAllMaterials: GetAllMaterials(
              materialRepository: MaterialRepositoryImpl(
                materialRemoteDataSource: MaterialRemoteDataSourceImpl(),
              ),
            ),
            deleteMaterial: DeleteMaterial(
              materialRepository: MaterialRepositoryImpl(
                materialRemoteDataSource: MaterialRemoteDataSourceImpl(),
              ),
            ),
            searchMaterial: SearchMaterial(
              materialRepository: MaterialRepositoryImpl(
                materialRemoteDataSource: MaterialRemoteDataSourceImpl(),
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => UserBloc(
              deleteUser: DeleteUser(
                userRepository: UserRepositoryImpl(
                  userRemoteDataSource: UserRemoteDataSourceImpl(),
                ),
              ),
              getAllUsers: GetAllUsers(
                userRepository: UserRepositoryImpl(
                  userRemoteDataSource: UserRemoteDataSourceImpl(),
                ),
              ),
              searchUser: SearchUser(
                userRepository: UserRepositoryImpl(
                  userRemoteDataSource: UserRemoteDataSourceImpl(),
                ),
              )),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(
              getAllProfiles: GetAllProfiles(
                profileRepository: ProfileRepositoryImpl(
                    profileRemoteDataSource: ProfileRemoteDataSourceImpl()),
              ),
              deleteProfile: DeleteProfile(
                profileRepository: ProfileRepositoryImpl(
                    profileRemoteDataSource: ProfileRemoteDataSourceImpl()),
              ),
              searchProfile: SearchProfile(
                  profileRepository: ProfileRepositoryImpl(
                      profileRemoteDataSource: ProfileRemoteDataSourceImpl()))),
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
