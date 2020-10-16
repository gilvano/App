import 'package:entrega_app/services/configserver_service.dart';
import 'package:entrega_app/services/localstorage_service.dart';
import 'package:entrega_app/services/navigation_service.dart';
import 'package:get_it/get_it.dart';

void setupLocator() {
  GetIt locator = GetIt.instance;

  locator.registerLazySingleton(() => NavigationService());
  locator.registerSingleton<LocalStorageService>(LocalStorageService());
  locator.registerSingleton<ConfigServerService>(
      ConfigServerService(locator.get<LocalStorageService>()));
}
