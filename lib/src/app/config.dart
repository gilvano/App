import 'package:flutter/material.dart';
import 'package:entrega_app/src/components/wField.dart';

class Configuracoes extends StatefulWidget {
  @override
  _ConfiguracoesState createState() => _ConfiguracoesState();
}

class _ConfiguracoesState extends State<Configuracoes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(71, 130, 116, 1.0),
        title: Text(
          'Configurações',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.bold 
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30, 0, 30,30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    EditWidget('IP do Servidor'),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    EditWidget('Porta'),
                  ],
                ),
              ),                
              Container(
                height: 50,
                margin: EdgeInsets.only(top: 10),
                child: RaisedButton(
                    color: Color.fromRGBO(71, 130, 116, 1.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(3.0),
                    ),
                    child: Center(
                      child: Text(
                        "Salvar",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    onPressed: () {}),
              ),
            ],
          ),
        ),
      )
    );
  }
}