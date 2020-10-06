import 'package:entrega_app/src/app/login.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: MaterialApp(
          title: 'Login',
          home: Login(),
        )
    );
  }
}