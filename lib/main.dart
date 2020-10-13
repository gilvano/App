import 'package:entrega_app/app/app.dart';
import 'package:entrega_app/services/configserver_service.dart';
import 'package:entrega_app/services/localstorage_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  setupLocator();
  runApp(App());
}

setupLocator() {
  GetIt locator = GetIt.instance;
  locator.registerSingleton<LocalStorageService>(LocalStorageService());
  locator.registerSingleton<ConfigServerService>(
      ConfigServerService(locator.get<LocalStorageService>()));
}
