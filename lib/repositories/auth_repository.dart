import 'package:entrega_app/infra/configServer.dart';
import 'package:entrega_app/infra/http/api_url_factory.dart';
import 'package:entrega_app/infra/http/http_client.dart';
import 'package:entrega_app/models/auth_model.dart';

class AuthRepository {
  AuthRepository(this.client);

  final HttpClient client;

  Future<AuthModel> login(
      Map<String, String> data, ConfigServer configServer) async {
    try {
      final _url = makeApiUrl("/auth/login", configServer);
      var response =
          await client.request(url: _url, method: 'post', body: data);
      print(response);
      return AuthModel.fromJson(response);
    } catch (e) {
      throw (e.toString());
    }
  }
}
