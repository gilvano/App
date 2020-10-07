import 'package:flutter/material.dart';
import 'package:entrega_app/src/components/wField.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Configuracoes extends StatefulWidget {
  @override
  _ConfiguracoesState createState() => _ConfiguracoesState();
}

class _ConfiguracoesState extends State<Configuracoes> {
  final iPController = TextEditingController();
  final portaController = TextEditingController();

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
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      EditWidget(
                        'IP do Servidor',
                        TextInputType.url,
                        false,
                        controller: iPController,                        
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      EditWidget('Porta', TextInputType.text, false),
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
                      onPressed: () {
                        _setIpFromSharedPref();
                      }),
                ),
              ],
            ),
          ),
        ));
  }

  Future<void> _setIpFromSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("IPSERVER", iPController.text);
  }

  // Future<String> _setPortaFromSharedPref() async {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     prefs.setString("IPSERVER", _controller.text);
  //     prefs.setBool("isON", isON);
  // }

  Future<String> _getIpFromSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("IPSERVER") ?? "";
  }

  @override
  void initState() {
      super.initState();
      _getIpFromSharedPref().then((s) {
          iPController.text = s;
      });
      // _getBoolFromSharedPref().then((b) {
      //     isON = b;
      // });
  }
}
