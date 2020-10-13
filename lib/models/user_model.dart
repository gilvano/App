class UserModel {
  int id;
  String username;
  String role;

  UserModel({this.id, this.username, this.role});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['role'] = this.role;
    return data;
  }
}
