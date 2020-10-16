import 'package:entrega_app/app/widgets/drawer/app_drawer.dart';
import 'package:entrega_app/services/navigation_service.dart';
import 'package:entrega_app/shared/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        //automaticallyImplyLeading: false,
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: InkWell(
          onTap: () {
            GetIt.I.get<NavigationService>().navigateTo(UsersRoute);
          },
          child: Card(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.account_box,
                    size: 50,
                  ),
                  title: Text('Usuários'),
                )
              ],
            ),
            elevation: 2,
          ),
        ),
      ),
    );
  }
}
