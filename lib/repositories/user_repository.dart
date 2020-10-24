import 'package:entrega_app/infra/http/api_url_factory.dart';
import 'package:entrega_app/infra/http/http_client.dart';
import 'package:entrega_app/models/user_model.dart';

class UserRepository {
  UserRepository(this.client);

  final HttpClient client;
  List<UserModel> users;

  Future<List<UserModel>> getAll() async {
    try {
      final _url = await makeApiUrl("/user");
      var response = await client.request(url: _url, method: 'get');
      print(response);
      users =
          List.from(response.map((user) => UserModel.fromJson(user)).toList());
    } catch (e) {
      throw (e.toString());
    }
    return users;
  }
}
