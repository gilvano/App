import 'package:entrega_app/app/pages/home/home.dart';
import 'package:entrega_app/app/pages/login/login.dart';
import 'package:entrega_app/blocs/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
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
