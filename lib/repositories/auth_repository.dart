import 'package:entrega_app/infra/http/api_url_factory.dart';
import 'package:entrega_app/infra/http/http_client.dart';

class AuthRepository {
  AuthRepository(this.client);

  final HttpClient client;

  Future<void> login(Map<String, dynamic> data) async {
    try {
      var response = await client.request(
          url: makeApiUrl("/auth/login"), method: 'post', body: data);
      print(response);
    } catch (e) {
      throw (e.toString());
    }
  }
}
