import 'package:entrega_app/app/pages/home/home.dart';
import 'package:entrega_app/app/pages/login/login.dart';
import 'package:entrega_app/app/widgets/app_theme.dart';
import 'package:entrega_app/blocs/auth/auth_bloc.dart';
import 'package:entrega_app/blocs/user/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              theme: makeAppTheme(),
              title: 'Login',
              home: BlocBuilder<AuthBloc, AuthState>(
                builder: (ctxb, state) {
                  if (state is AuthSuccessState) {
                    return Home();
                  } else {
                    return Login();
                  }
                },
              ),
            )));
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
