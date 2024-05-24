import 'package:amped_media_admin/config/router.dart';
import 'package:amped_media_admin/features/channel/data/datasources/channel_remote_datasource.dart';
import 'package:amped_media_admin/features/channel/data/repositories/channel_repository_impl.dart';
import 'package:amped_media_admin/features/channel/domain/entities/channel.dart';
import 'package:amped_media_admin/features/channel/domain/usecases/delete_channel.dart';
import 'package:amped_media_admin/features/channel/domain/usecases/get_all_channels.dart';
import 'package:amped_media_admin/features/channel/domain/usecases/search_channel.dart';
import 'package:amped_media_admin/features/channel/presentation/bloc/allchannels_bloc.dart';
import 'package:amped_media_admin/features/channelmaterial/data/datasources/channelmaterial_remote_data_source.dart';
import 'package:amped_media_admin/features/channelmaterial/data/repositories/channelmaterial_repository_impl.dart';
import 'package:amped_media_admin/features/channelmaterial/domain/usecases/delete_channelmaterial.dart';
import 'package:amped_media_admin/features/channelmaterial/domain/usecases/get_all_channelmaterials.dart';
import 'package:amped_media_admin/features/channelmaterial/domain/usecases/search_channelmaterial.dart';
import 'package:amped_media_admin/features/channelmaterial/presentation/bloc/channelmaterial_bloc.dart';
import 'package:amped_media_admin/features/material/data/datasources/material_remote_data_source.dart';
import 'package:amped_media_admin/features/material/data/repositories/material_repository_impl.dart';
import 'package:amped_media_admin/features/material/domain/usecases/delete_material.dart';
import 'package:amped_media_admin/features/material/domain/usecases/get_all_materials.dart';
import 'package:amped_media_admin/features/material/domain/usecases/search_material.dart';
import 'package:amped_media_admin/features/material_in_subscriptionplan/data/datasources/materin_subscriptionplan_remote_data_source.dart';
import 'package:amped_media_admin/features/material_in_subscriptionplan/data/repositories/materialin_subscriptionplan_repository_impl.dart';
import 'package:amped_media_admin/features/material_in_subscriptionplan/domain/usecases/delete_materialin_subscriptionplan.dart';
import 'package:amped_media_admin/features/material_in_subscriptionplan/domain/usecases/get_all_materialin_subscriptionplan.dart';
import 'package:amped_media_admin/features/material_in_subscriptionplan/domain/usecases/search_materialin_subscriptionplan.dart';
import 'package:amped_media_admin/features/material_in_subscriptionplan/presentation/bloc/materialin_subscriptionplan_bloc.dart';
import 'package:amped_media_admin/features/profile/data/datasource/profile_remote_data_source.dart';
import 'package:amped_media_admin/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:amped_media_admin/features/profile/domain/usecases/delete_profile.dart';
import 'package:amped_media_admin/features/profile/domain/usecases/get_all_profile.dart';
import 'package:amped_media_admin/features/profile/domain/usecases/search_profile.dart';
import 'package:amped_media_admin/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:amped_media_admin/features/replays/data/datasources/subscriptionPlan_remote_data_source.dart';
import 'package:amped_media_admin/features/replays/data/repositories/replay_repository_impl.dart';
import 'package:amped_media_admin/features/replays/domain/usecases/delete_replays.dart';
import 'package:amped_media_admin/features/replays/domain/usecases/get_all_replays.dart';
import 'package:amped_media_admin/features/replays/domain/usecases/search_replays.dart';
import 'package:amped_media_admin/features/replays/presentation/bloc/replay_bloc.dart';
import 'package:amped_media_admin/features/report/domain/usecases/get_all_report.dart';
import 'package:amped_media_admin/features/review_rate/data/datasources/rate_remote_data_source.dart';
import 'package:amped_media_admin/features/review_rate/data/repositories/rate_repository_impl.dart';
import 'package:amped_media_admin/features/review_rate/domain/ussecases/delete_rate.dart';
import 'package:amped_media_admin/features/review_rate/domain/ussecases/get_all_rate.dart';
import 'package:amped_media_admin/features/review_rate/domain/ussecases/search_rate.dart';
import 'package:amped_media_admin/features/review_rate/presentation/bloc/rate_bloc.dart';
import 'package:amped_media_admin/features/sellerprofile/data/datasources/sellerprofile_remote_data_source.dart';
import 'package:amped_media_admin/features/sellerprofile/data/repositories/sellerprofile_repository_impl.dart';
import 'package:amped_media_admin/features/sellerprofile/domain/usecases/delete_sellerprofile.dart';
import 'package:amped_media_admin/features/sellerprofile/domain/usecases/get_all_sellerprofile.dart';
import 'package:amped_media_admin/features/sellerprofile/domain/usecases/search_sellerprofile.dart';
import 'package:amped_media_admin/features/sellerprofile/presentation/bloc/sellerprofile_bloc.dart';
import 'package:amped_media_admin/features/subscriptionplan/data/datasources/subscriptionPlan_remote_data_source.dart';
import 'package:amped_media_admin/features/subscriptionplan/data/repositories/subscriptionplan_repository_impl.dart';
import 'package:amped_media_admin/features/subscriptionplan/domain/usecases/delete_subscriptionplan.dart';
import 'package:amped_media_admin/features/subscriptionplan/domain/usecases/get_all_subscriptionplan.dart';
import 'package:amped_media_admin/features/subscriptionplan/domain/usecases/search_subscriptionplan.dart';
import 'package:amped_media_admin/features/subscriptionplan/presentation/bloc/subscriptionplan_bloc.dart';
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
import 'features/report/data/datasources/report_remote_data_source.dart';
import 'features/report/data/repositories/report_repository_impl.dart';
import 'features/report/domain/usecases/delete_report.dart';
import 'features/report/domain/usecases/search_report.dart';
import 'features/report/presentation/bloc/report_bloc.dart';

void main() {
  initDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => serviceLocator<ChannelBloc>(),
        ),
        BlocProvider(
          create: (context) => serviceLocator<MaterialBloc>(),
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
        ),
        BlocProvider(
          create: (context) => SellerProfileBloc(
              getAllSellerProfiles: GetAllSellerProfiles(
                  sellerprofileRepository: SellerProfileRepositoryImpl(
                      sellerprofileRemoteDataSource:
                          SellerProfileRemoteDataSourceImpl())),
              deleteSellerProfile: DeleteSellerProfile(
                  sellerprofileRepository: SellerProfileRepositoryImpl(
                      sellerprofileRemoteDataSource:
                          SellerProfileRemoteDataSourceImpl())),
              searchSellerProfile: SearchSellerProfile(
                  sellerprofileRepository: SellerProfileRepositoryImpl(
                      sellerprofileRemoteDataSource:
                          SellerProfileRemoteDataSourceImpl()))),
        ),
        BlocProvider(
          create: (context) => ChannelMaterialBloc(
              getAllChannelMaterials: GetAllChannelMaterials(
                  channelmaterialRepository: ChannelMaterialRepositoryImpl(
                      channelmaterialRemoteDataSource:
                          ChannelMaterialRemoteDataSourceImpl())),
              deleteChannelMaterial: DeleteChannelMaterial(
                  channelmaterialRepository: ChannelMaterialRepositoryImpl(
                      channelmaterialRemoteDataSource:
                          ChannelMaterialRemoteDataSourceImpl())),
              searchChannelMaterial: SearchChannelMaterial(
                  channelmaterialRepository: ChannelMaterialRepositoryImpl(
                      channelmaterialRemoteDataSource:
                          ChannelMaterialRemoteDataSourceImpl()))),
        ),
        BlocProvider(
          create: (context) => SubscriptionPlanBloc(
            getAllSubscriptionPlan: GetAllSubscriptionPlan(
              subscriptionPlanRepository: SubscriptionPlanRepositoryImpl(
                subscriptionPlanRemoteDataSource:
                    SubscriptionPlanRemoteDataSourceImpl(),
              ),
            ),
            deleteSubscriptionPlan: DeleteSubscriptionPlan(
              subscriptionPlanRepository: SubscriptionPlanRepositoryImpl(
                subscriptionPlanRemoteDataSource:
                    SubscriptionPlanRemoteDataSourceImpl(),
              ),
            ),
            searchSubscriptionPlan: SearchSubscriptionPlan(
              subscriptionPlanRepository: SubscriptionPlanRepositoryImpl(
                subscriptionPlanRemoteDataSource:
                    SubscriptionPlanRemoteDataSourceImpl(),
              ),
            ),
          ),
        ),
        BlocProvider(
            create: (context) => MaterialInSubscriptionPlanBloc(
                  getAllMaterialInSubscriptionPlans:
                      GetAllMaterialInSubscriptionPlan(
                          materialInSubscriptionPlanRepository:
                              MaterialInSubscriptionPlanRepositoryImpl(
                                  materialInSubscriptionPlanRemoteDataSource:
                                      MaterialInSubscriptionPlanRemoteDataSourceImpl())),
                  deleteMaterialInSubscriptionPlan:
                      DeleteMaterialInSubscriptionPlan(
                          materialInSubscriptionPlanRepository:
                              MaterialInSubscriptionPlanRepositoryImpl(
                                  materialInSubscriptionPlanRemoteDataSource:
                                      MaterialInSubscriptionPlanRemoteDataSourceImpl())),
                  searchMaterialInSubscriptionPlan:
                      SearchMaterialInSubscriptionPlan(
                          materialInSubscriptionPlanRepository:
                              MaterialInSubscriptionPlanRepositoryImpl(
                                  materialInSubscriptionPlanRemoteDataSource:
                                      MaterialInSubscriptionPlanRemoteDataSourceImpl())),
                )),
        BlocProvider(
          create: (context) => ReplayBloc(
              getAllReplays: GetAllReplays(
                  replaysRepository: ReplayRepositoryImpl(
                      replayRemoteDataSource: ReplayRemoteDataSourceImpl())),
              deleteReplay: DeleteReplay(
                  replayRepository: ReplayRepositoryImpl(
                      replayRemoteDataSource: ReplayRemoteDataSourceImpl())),
              searchReplay: SearchReplay(
                  replayRepository: ReplayRepositoryImpl(
                      replayRemoteDataSource: ReplayRemoteDataSourceImpl()))),
        ),
        BlocProvider(
          create: (context) => RateBloc(
              getAllRates: GetAllRate(
                  ratesRepository: RateRepositoryImpl(
                      rateRemoteDataSource: RateRemoteDataSourceImpl())),
              deleteRate: DeleteRate(
                  rateRepository: RateRepositoryImpl(
                      rateRemoteDataSource: RateRemoteDataSourceImpl())),
              searchRate: SearchRate(
                  rateRepository: RateRepositoryImpl(
                      rateRemoteDataSource: RateRemoteDataSourceImpl()))),
        ),
        BlocProvider(
          create: (context) => ReportBloc(
              getAllReports: GetAllReports(
                  reportsRepository: ReportRepositoryImpl(
                      reportRemoteDataSource: ReportRemoteDataSourceImpl())),
              deleteReport: DeleteReport(
                  reportRepository: ReportRepositoryImpl(
                      reportRemoteDataSource: ReportRemoteDataSourceImpl())),
              searchReport: SearchReport(
                  reportRepository: ReportRepositoryImpl(
                      reportRemoteDataSource: ReportRemoteDataSourceImpl()))),
        ),
      ],
      child: MyApp(),
      // 0966783851
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
