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

void _initRate() {}

void _initReport() {}

void _initRePlay() {}

void _initSubscriptionPlan() {}

void _initChannelMaterial() {}

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

void _initSellerProfile() {}

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
