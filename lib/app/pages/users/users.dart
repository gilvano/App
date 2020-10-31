import 'package:entrega_app/app/widgets/user/user_item.dart';
import 'package:entrega_app/blocs/user/user_bloc.dart';
import 'package:entrega_app/services/navigation_service.dart';
import 'package:entrega_app/shared/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    userBloc.getUsers();

    return Scaffold(
        appBar: AppBar(
          title: Text('Usuários'),
          actions: [
            IconButton(
                icon: const Icon(Icons.add),
                onPressed: () async {
                  await GetIt.I
                      .get<NavigationService>()
                      .navigateTo(UserFormRoute);
                  await userBloc.getUsers();
                })
          ],
        ),
        body: BlocConsumer<UserBloc, UserState>(
          listener: (lsnrctx, state) {
            if (state is UserErrorState) {
              Scaffold.of(lsnrctx).showSnackBar(SnackBar(
                  content: Text(
                state.message,
              )));
            } else if (state is UserDeletedState) {
              Scaffold.of(lsnrctx).showSnackBar(SnackBar(
                  content: Text(
                'Usuário: ${state.user.username} deletado com sucesso!',
              )));
            } else if (state is UserSavedState) {
              Scaffold.of(lsnrctx).showSnackBar(SnackBar(
                  content: Text(
                'Usuário criado com sucesso!',
              )));
            }
          },
          builder: (bldrctx, state) {
            if (state is UsersLoadedState) {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: state.users.length,
                itemBuilder: (BuildContext ctx, int index) {
                  final user = state.users[index];
                  return UserItem(user: user);
                },
              );
            } else if (state is UserLoadingState ||
                state is UserDeletingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
