import 'package:entrega_app/blocs/user/user_bloc.dart';
import 'package:entrega_app/models/user_model.dart';
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
        appBar: AppBar(),
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
                  return _getListUsers(index, state.users);
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

  Widget _getListUsers(int index, List<UserModel> listUsers) {
    return Container(
      margin: EdgeInsets.all(5.0),
      height: 50.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0), color: Colors.grey[200]),
      child: Text(
        listUsers[index].username,
      ),
    );
  }
}
