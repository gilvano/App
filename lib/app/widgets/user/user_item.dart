import 'package:entrega_app/models/user_model.dart';
import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  const UserItem({
    Key key,
    @required this.user,
  }) : super(key: key);

  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Icon(Icons.account_circle),
            ),
          ),
        ),
        title:
            Text(user.username, style: Theme.of(context).textTheme.headline6),
        subtitle: Text(
          user.role,
        ),
        trailing: MediaQuery.of(context).size.width > 480
            ? FlatButton.icon(
                icon: Icon(Icons.delete),
                onPressed: () => {}, //onRemove(user.id),
                label: Text('Excluir'),
                textColor: Theme.of(context).errorColor,
              )
            : IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => {}, //() => onRemove(user.id),
              ),
      ),
    );
  }
}