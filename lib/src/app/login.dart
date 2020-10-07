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
        body: Container(
          child: Padding(
            padding: EdgeInsets.all(30),
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
                      color: Color.fromRGBO(71, 130, 116, 1.0), 
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      EditWidget('Email'),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      EditWidget('Senha'),
                    ],
                  ),
                ),                
                Container(
                  height: 50,
                  margin: EdgeInsets.only(top: 20),
                  child: RaisedButton(
                      color: Color.fromRGBO(71, 130, 116, 1.0),
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
                      onPressed: () {}),
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
                            onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
