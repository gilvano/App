import 'package:entrega_app/blocs/localentrega/local_entrega_bloc.dart';
import 'package:entrega_app/models/local_entrega_model.dart';
import 'package:entrega_app/services/navigation_service.dart';
import 'package:entrega_app/shared/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class LocalEntregaItem extends StatelessWidget {
  const LocalEntregaItem({
    Key key,
    @required this.local,
  }) : super(key: key);

  final LocalEntregaModel local;
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
            Text(local.descricao, style: Theme.of(context).textTheme.headline6),
        onTap: () => _openUserForm(context),
        trailing: MediaQuery.of(context).size.width > 480
            ? FlatButton.icon(
                icon: Icon(Icons.delete),
                onPressed: () async => await _deleteLocalEntrega(context),
                label: Text('Excluir'),
                textColor: Theme.of(context).errorColor,
              )
            : IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () async => await _deleteLocalEntrega(context),
              ),
      ),
    );
  }

  Future<void> _openUserForm(BuildContext context) async {
    var bloc = BlocProvider.of<LocalEntregaBloc>(context);

    // await GetIt.I
    //     .get<NavigationService>()
    //     .navigateTo(UserFormRoute, arguments: user);

    await bloc.getLocaisEntrega();
  }

  _deleteLocalEntrega(BuildContext context) async {
    var bloc = BlocProvider.of<LocalEntregaBloc>(context);
    await bloc.deleteLocalEntrega(local);
    await Future.delayed(Duration(milliseconds: 200));
    await bloc.getLocaisEntrega();
  }
}
