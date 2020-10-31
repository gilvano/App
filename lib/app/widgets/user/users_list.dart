import 'package:entrega_app/app/widgets/user/user_item.dart';
import 'package:entrega_app/models/user_model.dart';
import 'package:flutter/widgets.dart';

class UsersList extends StatelessWidget {
  final List<UserModel> users;
  UsersList(this.users);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: users.length,
      itemBuilder: (BuildContext ctx, int index) {
        final user = users[index];
        return UserItem(user: user);
      },
    );
  }
}
