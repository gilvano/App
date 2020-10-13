import 'package:entrega_app/infra/cache/secure_storage_adapter.dart';
import 'package:entrega_app/infra/http/http_adapter.dart';
import 'package:entrega_app/infra/http/http_client.dart';
import 'package:http/http.dart';

HttpClient makeHttpAdapter(SecureStorageAdapter storage) =>
    HttpAdapter(Client(), storage);
