import 'package:entrega_app/app/pages/home/home.dart';
import 'package:entrega_app/app/pages/login/login.dart';
import 'package:entrega_app/app/pages/users/users.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:entrega_app/shared/route_paths.dart' as routes;

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routes.LoginRoute:
      return MaterialPageRoute(builder: (context) => Login());
    case routes.HomeRoute:
      return MaterialPageRoute(builder: (context) => Home());
    case routes.UsersRoute:
      return MaterialPageRoute(builder: (context) => UsersPage());
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(
            child: Text('No path for ${settings.name}'),
          ),
        ),
      );
  }
}
