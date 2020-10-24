import 'package:entrega_app/app/widgets/drawer/drawer_item.dart';
import 'package:entrega_app/services/navigation_service.dart';
import 'package:entrega_app/shared/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.green,
      child: Drawer(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: ListView(
            children: <Widget>[
              Divider(
                color: Colors.blueGrey,
              ),
              Column(
                children: <Widget>[
                  DrawerItem(
                    label: 'Home',
                    iconData: Icons.home,
                    onTap: () {
                      GetIt.I.get<NavigationService>().navigateTo(HomeRoute);
                    },
                  ),
                  DrawerItem(
                    label: 'Usuários',
                    iconData: Icons.person,
                    onTap: () {
                      GetIt.I.get<NavigationService>().navigateTo(UsersRoute);
                    },
                  ),
                  DrawerItem(
                    label: 'Clientes',
                    iconData: Icons.group_add,
                    onTap: () {
                      GetIt.I.get<NavigationService>().navigateTo(UsersRoute);
                    },
                  ),
                  DrawerItem(
                    label: 'Fornecedores',
                    iconData: Icons.domain,
                    onTap: () {
                      GetIt.I.get<NavigationService>().navigateTo(UsersRoute);
                    },
                  ),
                  DrawerItem(
                    label: 'Preços',
                    iconData: Icons.local_atm,
                    onTap: () {
                      GetIt.I.get<NavigationService>().navigateTo(UsersRoute);
                    },
                  ),
                  DrawerItem(
                    label: 'Locais',
                    iconData: Icons.pin_drop,
                    onTap: () {
                      GetIt.I.get<NavigationService>().navigateTo(UsersRoute);
                    },
                  ),
                  DrawerItem(
                    label: 'Sair',
                    iconData: Icons.exit_to_app,
                    onTap: () {
                      GetIt.I.get<NavigationService>().navigateTo(UsersRoute);
                    },
                  ),
                ],
              ),
              Divider(
                color: Colors.blueGrey[50],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
