import 'package:entrega_app/app/widgets/app_theme.dart';
import 'package:entrega_app/blocs/auth/auth_bloc.dart';
import 'package:entrega_app/blocs/user/user_bloc.dart';
import 'package:entrega_app/services/navigation_service.dart';
import 'package:entrega_app/shared/route_paths.dart' as routes;
import 'package:entrega_app/shared/router.dart' as router;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: MultiBlocProvider(
            providers: [
              BlocProvider<AuthBloc>(
                create: (context) => AuthBloc(),
              ),
              BlocProvider<UserBloc>(
                create: (context) => UserBloc(),
              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              navigatorKey: GetIt.I.get<NavigationService>().navigatorKey,
              onGenerateRoute: router.generateRoute,
              initialRoute: routes.LoginRoute,
              theme: makeAppTheme(),
              title: 'Login',
            )));
  }
}
