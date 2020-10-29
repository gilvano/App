import 'package:entrega_app/services/localstorage_service.dart';
import 'package:get_it/get_it.dart';

class ConfigServerService {
  LocalStorageService _localStorageService;
  String _ip;
  String _port;

  ConfigServerService() {
    _localStorageService = GetIt.I.get<LocalStorageService>();
  }

  set setIp(String value) {
    _save('IPSERVER', value);
    this._ip = value;
  }

  set setPort(String value) {
    _save('PORTSERVER', value);
    this._port = value;
  }

  Future<String> get getIp async {
    this._ip = await _read('IPSERVER');
    return this._ip;
  }

  Future<String> get getPort async {
    this._port = await _read('PORTSERVER');
    return this._port;
  }

  Future<String> _read(String key) async {
    final value = _localStorageService.read(key);
    return value;
  }

  _save(String key, value) async {
    _localStorageService.save(key, value);
  }
}
