import 'package:entrega_app/app/widgets/user/user_item.dart';
import 'package:entrega_app/blocs/user/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<UserBloc>(context);
    bloc.getUsers();

    return Scaffold(
        appBar: AppBar(
          title: Text('Usuários'),
        ),
        body: BlocConsumer<UserBloc, UserState>(
          listener: (lsnrctx, state) {
            if (state is UserErrorState) {
              Scaffold.of(lsnrctx).showSnackBar(SnackBar(
                  content: Text(
                state.message,
              )));
            }
          },
          builder: (bldrctx, state) {
            if (state is UserLoadedState) {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: state.users.length,
                itemBuilder: (BuildContext ctx, int index) {
                  final user = state.users[index];
                  return UserItem(user: user);
                },
              );
            } else {
              return Column(
                children: [
                  Text('teste'),
                ],
              );
            }
          },
        ));
  }
}
