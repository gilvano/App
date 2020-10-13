import 'package:entrega_app/infra/cache/secure_storage_adapter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

SecureStorageAdapter makeSecureStorageAdapter() =>
    SecureStorageAdapter(secureStorage: FlutterSecureStorage());
