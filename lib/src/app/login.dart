import 'package:flutter/material.dart';
import 'package:entrega_app/src/components/wField.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EditWidget('Email'),
                ],
              ),
            ),
            Container(
              child: Icon(
                Icons.tune,
                color: Colors.grey,
                size: 24.0,
                semanticLabel: 'Configurações do servidor'
              ),
            ),
          ],
        ), 
      )
    );
  }
}