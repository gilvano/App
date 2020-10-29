import 'package:entrega_app/app/pages/home/home.dart';
import 'package:entrega_app/app/pages/login/login.dart';
import 'package:entrega_app/app/pages/users/users.dart';
import 'package:entrega_app/app/widgets/user/user_form.dart';
import 'package:entrega_app/models/user_model.dart';
import 'package:entrega_app/shared/route_paths.dart' as routes;
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routes.LoginRoute:
      return MaterialPageRoute(builder: (context) => Login());
    case routes.HomeRoute:
      return MaterialPageRoute(builder: (context) => Home());
    case routes.UsersRoute:
      return MaterialPageRoute(builder: (context) => UsersPage());
    case routes.UserFormRoute:
      UserModel user = settings.arguments as UserModel;
      return MaterialPageRoute(
          builder: (context) => UserForm(
                user: user,
              ));
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
