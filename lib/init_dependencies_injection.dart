part of 'init_dependencies.dart';

final serviceLocator = GetIt.instance;
Future<void> initDependencies() async {
  _initChannel();
  setupRouteLocator();
}

void setupRouteLocator() {
  serviceLocator.registerLazySingleton(() => NavigationService());
  // locator.registerLazySingleton(() => Api());
}

void _initChannel() {}
