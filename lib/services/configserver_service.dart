import 'package:entrega_app/services/localstorage_service.dart';

class ConfigServerService {
  final LocalStorageService localStorageService;
  String _ip;
  String _port;

  ConfigServerService(this.localStorageService);

  set setIp(String value) {
    _save('IPSERVER', value);
    this._ip = value;
  }

  set setPort(String value) {
    _save('PORTSERVER', value);
    this._port = value;
  }

  String get getIp {
    _read('IPSERVER').then((s) {
      this._ip = s;
    });
    return _ip;
  }

  String get getPort {
    _read('PORTSERVER').then((s) {
      this._port = s;
    });
    return _port;
  }

  Future<String> _read(String key) async {
    final value = localStorageService.read(key);
    return value;
  }

  _save(String key, value) async {
    localStorageService.save(key, value);
  }
}
