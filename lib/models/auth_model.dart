
class AuthModel {
  String username;
  String token;

  AuthModel({this.username, this.token});

  AuthModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['token'] = this.token;
    return data;
  }
}