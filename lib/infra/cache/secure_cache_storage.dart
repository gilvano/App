import 'package:meta/meta.dart';

abstract class SecureCacheStorage {
  Future<void> saveSecure({@required String key, @required String value});
  Future<String> fetchSecure(String key);
}
