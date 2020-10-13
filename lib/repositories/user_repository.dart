import 'package:entrega_app/infra/configServer.dart';
import 'package:entrega_app/infra/http/api_url_factory.dart';
import 'package:entrega_app/infra/http/http_client.dart';
import 'package:entrega_app/models/user_model.dart';

class UserRepository {
  UserRepository(this.client);

  final HttpClient client;

  Future<List<UserModel>> getAll() async {
    try {
      final _url = makeApiUrl("/user", ConfigServer());
      var response = await client.request(url: _url, method: 'get');
      print(response);
      return (response.data as List)
          .map((user) => UserModel.fromJson(user))
          .toList();
    } catch (e) {
      throw (e.toString());
    }
  }
}
