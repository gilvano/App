import 'package:entrega_app/infra/configServer.dart';
import 'package:flutter/material.dart';
import 'package:entrega_app/app/widgets/wField.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Configuracoes extends StatefulWidget {
  ConfigServer _configServer;

  @override
  _ConfiguracoesState createState() => _ConfiguracoesState(_configServer);
  Configuracoes(ConfigServer configServer) {
    this._configServer = configServer;
  }
}

class _ConfiguracoesState extends State<Configuracoes> {
  final iPController = TextEditingController();
  final portaController = TextEditingController();
  ConfigServer _configServer;

  _ConfiguracoesState(ConfigServer configServer) {
    this._configServer = configServer;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(71, 130, 116, 1.0),
        title: Text(
          'Configurações',
          style: TextStyle(
              fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Builder(
          builder: (context) => Container(
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
                            EditWidget(
                              'Porta',
                              TextInputType.number,
                              false,
                              controller: portaController,
                            ),
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
                              _setPortaFromSharedPref();
                              final snackBar = SnackBar(
                                content: Text('Configurações salvas!'),
                              );
                              Scaffold.of(context).showSnackBar(snackBar);
                            }),
                      ),
                    ],
                  ),
                ),
              )),
    );
  }

  Future<void> _setIpFromSharedPref() async {
    _configServer.setIp = iPController.text;
  }

  Future<void> _setPortaFromSharedPref() async {
    _configServer.setPort = portaController.text;
  }

  @override
  void initState() {
    super.initState();    
    iPController.text = _configServer.getIp;
    portaController.text = _configServer.getPort;
  }
}
