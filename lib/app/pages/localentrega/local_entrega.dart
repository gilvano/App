import 'package:entrega_app/app/widgets/local_entrega/local_entrega_list.dart';
import 'package:entrega_app/blocs/localentrega/local_entrega_bloc.dart';
import 'package:entrega_app/services/navigation_service.dart';
import 'package:entrega_app/shared/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class LocaisEntrega extends StatefulWidget {
  @override
  _LocaisEntregaState createState() => _LocaisEntregaState();
}

class _LocaisEntregaState extends State<LocaisEntrega> {
  @override
  Widget build(BuildContext context) {
    final localEntregaBloc = BlocProvider.of<LocalEntregaBloc>(context);
    localEntregaBloc.getLocaisEntrega();

    return Scaffold(
        appBar: AppBar(
          title: Text('Usuários'),
          actions: [
            IconButton(
                icon: const Icon(Icons.add),
                onPressed: () async {
                  // await GetIt.I
                  //     .get<NavigationService>()
                  //     .navigateTo(UserFormRoute);
                  // await localEntregaBloc.getUsers();
                })
          ],
        ),
        body: BlocConsumer<LocalEntregaBloc, LocalEntregaState>(
          listener: (lsnrctx, state) {
            if (state is LocalEntregaErrorState) {
              Scaffold.of(lsnrctx).showSnackBar(SnackBar(
                  content: Text(
                state.message,
              )));
            } else if (state is LocalEntregaDeletedState) {
              Scaffold.of(lsnrctx).showSnackBar(SnackBar(
                  content: Text(
                'Usuário: ${state.localEntrega.descricao} deletado com sucesso!',
              )));
            } else if (state is LocalEntregaSavedState) {
              Scaffold.of(lsnrctx).showSnackBar(SnackBar(
                  content: Text(
                'Usuário criado com sucesso!',
              )));
            }
          },
          builder: (bldrctx, state) {
            if (state is LocalEntregasLoadedState) {
              return LocaisList(state.locaisEntrega);
            } else if (state is LocalEntregaLoadingState ||
                state is LocalEntregaDeletingState) {
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
