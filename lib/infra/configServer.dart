import 'package:shared_preferences/shared_preferences.dart';

class ConfigServer {
  String _ip;
  String _port;

  ConfigServer() {
    getIp;
    getPort;
  }

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
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(key) ?? '';
    return value;
  }

  _save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }
}
