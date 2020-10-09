import 'package:dio/dio.dart';
import 'package:entrega_app/models/auth_model.dart';


class AuthRepository {
  AuthRepository(this.client) {
    this.client.options.baseUrl = 'http://192.168.1.102:3000';
  }

  final Dio client;

  Future<Map> login(Map<String, dynamic> data) async {
    try {
      var response = await client.post("/auth/login", data: data);
      return response.data;
    } on DioError catch (e) {
      throw (e.message);
    }
  }
 
}
