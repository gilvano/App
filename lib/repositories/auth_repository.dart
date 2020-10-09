import 'package:dio/dio.dart';
import 'package:entrega_app/shared/constants.dart';

class AuthRepository {
  AuthRepository(this.client) {
    client.options.baseUrl = BASE_URL;
    //client.options.connectTimeout = 5000;
  }

  final Dio client;

  Future<void> login(Map<String, dynamic> data) async {
    var response = Response(statusCode: 500, statusMessage: '');
    try {
      response = await client.post("/auth/login", data: data);
      print(response);
    } on DioError catch (e) {
      throw (e.message);
    }

    return _handleResponse(response);
  }

  Map _handleResponse(Response response) {
    if (response.statusCode == 200) {
      return response.data.isEmpty ? null : response.data;
    } else if (response.statusCode == 204) {
      return null;
      // } else if (response.statusCode == 400) {
      //   throw HttpError.badRequest;
      // } else if (response.statusCode == 401) {
      //   throw HttpError.unauthorized;
      // } else if (response.statusCode == 403) {
      //   throw HttpError.forbidden;
      // } else if (response.statusCode == 404) {
      //   throw HttpError.notFound;
    } else {
      throw ("${response.statusCode} : ${response.statusMessage}");
    }
  }
}
