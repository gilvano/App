import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  SharedPreferences _preferences;

  _initSharedPreferences() async {
    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }
  }

  Future<String> read(String key) async {
    await _initSharedPreferences();
    return _preferences.getString(key) ?? '';
  }

  save(String key, value) async {
    await _initSharedPreferences();
    _preferences.setString(key, value);
  }
}
