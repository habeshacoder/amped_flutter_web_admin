part of 'init_dependencies.dart';

final serviceLocator = GetIt.instance;
Future<void> initDependencies() async {
  setupRouteLocator();
  _initMaterial();
  _initChannel();
  _initUser();
  _initProfile();
  _initSellerProfile();
  _initSubscribedUser();
  _initChannelMaterial();
  _initSubscriptionPlan();
  _initRePlay();
  _initReport();
  _initRate();
}

void setupRouteLocator() {
  serviceLocator.registerLazySingleton(() => NavigationService());
}

void _initRate() {
  serviceLocator.registerFactory<ReportRemoteDataSource>(
      () => ReportRemoteDataSourceImpl());
  serviceLocator.registerFactory<ReportRepository>(
      () => ReportRepositoryImpl(reportRemoteDataSource: serviceLocator()));
  serviceLocator.registerFactory(
      () => GetAllReports(reportsRepository: serviceLocator()));
  serviceLocator
      .registerFactory(() => DeleteReport(reportRepository: serviceLocator()));
  serviceLocator
      .registerFactory(() => SearchReport(reportRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(() => ReportBloc(
      deleteReport: serviceLocator(),
      getAllReports: serviceLocator(),
      searchReport: serviceLocator()));
}

void _initReport() {
  serviceLocator
      .registerFactory<RateRemoteDataSource>(() => RateRemoteDataSourceImpl());
  serviceLocator.registerFactory<RateRepository>(
      () => RateRepositoryImpl(rateRemoteDataSource: serviceLocator()));
  serviceLocator
      .registerFactory(() => GetAllRate(ratesRepository: serviceLocator()));
  serviceLocator
      .registerFactory(() => DeleteRate(rateRepository: serviceLocator()));
  serviceLocator
      .registerFactory(() => SearchRate(rateRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(() => RateBloc(
      deleteRate: serviceLocator(),
      getAllRates: serviceLocator(),
      searchRate: serviceLocator()));
}

void _initRePlay() {
  serviceLocator.registerFactory<ReplayRemoteDataSource>(
      () => ReplayRemoteDataSourceImpl());
  serviceLocator.registerFactory<ReplayRepository>(
      () => ReplayRepositoryImpl(replayRemoteDataSource: serviceLocator()));
  serviceLocator.registerFactory(
      () => GetAllReplays(replaysRepository: serviceLocator()));
  serviceLocator
      .registerFactory(() => DeleteReplay(replayRepository: serviceLocator()));
  serviceLocator
      .registerFactory(() => SearchReplay(replayRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(() => ReplayBloc(
      deleteReplay: serviceLocator(),
      getAllReplays: serviceLocator(),
      searchReplay: serviceLocator()));
}

void _initSubscriptionPlan() {
  serviceLocator.registerFactory<SubscriptionPlanRemoteDataSource>(
      () => SubscriptionPlanRemoteDataSourceImpl());
  serviceLocator.registerFactory<SubscriptionPlanRepository>(() =>
      SubscriptionPlanRepositoryImpl(
          subscriptionPlanRemoteDataSource: serviceLocator()));
  serviceLocator.registerFactory(() =>
      GetAllSubscriptionPlan(subscriptionPlanRepository: serviceLocator()));
  serviceLocator.registerFactory(() =>
      DeleteSubscriptionPlan(subscriptionPlanRepository: serviceLocator()));
  serviceLocator.registerFactory(() =>
      SearchSubscriptionPlan(subscriptionPlanRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(() => SubscriptionPlanBloc(
      deleteSubscriptionPlan: serviceLocator(),
      getAllSubscriptionPlan: serviceLocator(),
      searchSubscriptionPlan: serviceLocator()));
}

void _initChannelMaterial() {
  serviceLocator.registerFactory<ChannelMaterialRemoteDataSource>(
      () => ChannelMaterialRemoteDataSourceImpl());
  serviceLocator.registerFactory<ChannelMaterialRepository>(() =>
      ChannelMaterialRepositoryImpl(
          channelmaterialRemoteDataSource: serviceLocator()));
  serviceLocator.registerFactory(() =>
      GetAllChannelMaterials(channelmaterialRepository: serviceLocator()));
  serviceLocator.registerFactory(
      () => DeleteChannelMaterial(channelmaterialRepository: serviceLocator()));
  serviceLocator.registerFactory(
      () => SearchChannelMaterial(channelmaterialRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(() => ChannelMaterialBloc(
      deleteChannelMaterial: serviceLocator(),
      getAllChannelMaterials: serviceLocator(),
      searchChannelMaterial: serviceLocator()));
}

void _initSubscribedUser() {}

void _initProfile() {
  serviceLocator.registerFactory<ProfileRemoteDataSource>(
      () => ProfileRemoteDataSourceImpl());
  serviceLocator.registerFactory<ProfileRepository>(
      () => ProfileRepositoryImpl(profileRemoteDataSource: serviceLocator()));
  serviceLocator.registerFactory(
      () => GetAllProfiles(profileRepository: serviceLocator()));
  serviceLocator.registerFactory(
      () => DeleteProfile(profileRepository: serviceLocator()));
  serviceLocator.registerFactory(
      () => SearchProfile(profileRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(() => ProfileBloc(
      deleteProfile: serviceLocator(),
      getAllProfiles: serviceLocator(),
      searchProfile: serviceLocator()));
}

void _initSellerProfile() {
  serviceLocator.registerFactory<SellerProfileRemoteDataSource>(
      () => SellerProfileRemoteDataSourceImpl());
  serviceLocator.registerFactory<SellerProfileRepository>(() =>
      SellerProfileRepositoryImpl(
          sellerprofileRemoteDataSource: serviceLocator()));
  serviceLocator.registerFactory(
      () => GetAllSellerProfiles(sellerprofileRepository: serviceLocator()));
  serviceLocator.registerFactory(
      () => DeleteSellerProfile(sellerprofileRepository: serviceLocator()));
  serviceLocator.registerFactory(
      () => SearchSellerProfile(sellerprofileRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(() => SellerProfileBloc(
      deleteSellerProfile: serviceLocator(),
      getAllSellerProfiles: serviceLocator(),
      searchSellerProfile: serviceLocator()));
}

void _initUser() {
  serviceLocator
      .registerFactory<UserRemoteDataSource>(() => UserRemoteDataSourceImpl());
  serviceLocator.registerFactory<UserRepository>(
      () => UserRepositoryImpl(userRemoteDataSource: serviceLocator()));
  serviceLocator
      .registerFactory(() => GetAllUsers(userRepository: serviceLocator()));
  serviceLocator
      .registerFactory(() => DeleteUser(userRepository: serviceLocator()));
  serviceLocator
      .registerFactory(() => SearchUser(userRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(() => UserBloc(
      deleteUser: serviceLocator(),
      getAllUsers: serviceLocator(),
      searchUser: serviceLocator()));
}

void _initMaterial() {
  serviceLocator.registerFactory<MaterialRemoteDataSource>(
      () => MaterialRemoteDataSourceImpl());
  serviceLocator.registerFactory<MaterialRepository>(
      () => MaterialRepositoryImpl(materialRemoteDataSource: serviceLocator()));
  serviceLocator.registerFactory(
      () => GetAllMaterials(materialRepository: serviceLocator()));
  serviceLocator.registerFactory(
      () => DeleteMaterial(materialRepository: serviceLocator()));
  serviceLocator.registerFactory(
      () => SearchMaterial(materialRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(() => MaterialBloc(
      deleteMaterial: serviceLocator(),
      getAllMaterials: serviceLocator(),
      searchMaterial: serviceLocator()));
}

void _initChannel() {
  serviceLocator.registerFactory<ChannelRemoteDataSource>(
      () => ChannelRemoteDataSourceImpl());
  serviceLocator.registerFactory<ChannelRepository>(
      () => ChannelRepositoryImpl(channelRemoteDataSource: serviceLocator()));
  serviceLocator.registerFactory(
      () => GetAllChannels(channelRepository: serviceLocator()));
  serviceLocator.registerFactory(
      () => DeleteChannel(channelRepository: serviceLocator()));
  serviceLocator.registerFactory(
      () => SearchChannel(channelRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(() => ChannelBloc(
      deleteChannel: serviceLocator(),
      getAllChannels: serviceLocator(),
      searchChannel: serviceLocator()));
}
