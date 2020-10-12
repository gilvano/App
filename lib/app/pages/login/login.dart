import 'package:entrega_app/app/pages/conf/config.dart';
import 'package:entrega_app/blocs/auth_bloc.dart';
import 'package:entrega_app/infra/configServer.dart';
import 'package:flutter/material.dart';
import 'package:entrega_app/app/widgets/wField.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _usernameController = TextEditingController(text: "");
  TextEditingController _passwordController = TextEditingController(text: "");

  final configServer = new ConfigServer();

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AuthBloc>(context);

    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthErrorState) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontFamily: 'PlayfairDisplay',
                        fontSize: 80.0,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        EditWidget(
                          'Email',
                          TextInputType.emailAddress,
                          false,
                          controller: _usernameController,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        EditWidget(
                          'Senha',
                          TextInputType.visiblePassword,
                          true,
                          controller: _passwordController,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    margin: EdgeInsets.only(top: 20),
                    child: RaisedButton(
                        color: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(3.0),
                        ),
                        child: Center(
                          child: Text(
                            "Entrar",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        onPressed: () {
                          bloc.authenticate(
                            _usernameController.text.trim(),
                            _passwordController.text.trim(),
                            configServer
                          );
                        }),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: IconButton(
                            padding: EdgeInsets.only(top: 10.0),
                            icon: Icon(Icons.tune),
                            color: Colors.grey,
                            iconSize: 24.0,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Configuracoes(configServer)));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
