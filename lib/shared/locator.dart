import 'package:entrega_app/services/configserver_service.dart';
import 'package:entrega_app/services/localstorage_service.dart';
import 'package:entrega_app/services/navigation_service.dart';
import 'package:get_it/get_it.dart';

Future<void> setupLocator() async {
  GetIt.I.registerLazySingleton(() => NavigationService());
  GetIt.I.registerSingleton<LocalStorageService>(LocalStorageService());
  GetIt.I.registerSingleton<ConfigServerService>(ConfigServerService());
}
