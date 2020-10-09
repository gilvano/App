import 'package:entrega_app/app/pages/home/home.dart';
import 'package:entrega_app/app/pages/login/login.dart';
import 'package:entrega_app/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Login',
          home: BlocProvider<LoginCubit>(
            create: (context) => LoginCubit(),
            child: BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                if (state is LoginSuccessState) {
                  return Home();
                }

                if (state is LoginInProgressState) {
                  return Center(child: CircularProgressIndicator());
                }

                return Login();
              },
            ),
          ),
        ));
  }
}
