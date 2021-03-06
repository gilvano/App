class AuthModel {
  String username;
  String role;
  String token;

  AuthModel({this.username, this.role, this.token});

  AuthModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    role = json['role'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['role'] = this.role;
    data['token'] = this.token;
    return data;
  }
}
