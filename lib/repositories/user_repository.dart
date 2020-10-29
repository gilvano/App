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

  Future<void> saveUser(Map<String, String> data) async {
    try {
      final _url = await makeApiUrl("/user");
      var response =
          await client.request(url: _url, method: 'post', body: data);
      print(response.toString());
    } catch (e) {
      throw (e.toString());
    }
  }

  Future<void> editUser(UserModel userModel) async {
    try {
      final _url = await makeApiUrl('/user/' + userModel.id.toString());
      var response = await client.request(url: _url, method: 'patch', body: {
        "username": userModel.username,
        "role": userModel.role,
      });
      print(response);
    } catch (e) {
      throw (e.toString());
    }
  }

  Future<void> deleteUser(UserModel userModel) async {
    try {
      final _url = await makeApiUrl('/user/' + userModel.id.toString());
      var response = await client.request(url: _url, method: 'delete');
      print(response);
    } catch (e) {
      throw (e.toString());
    }
  }
}
