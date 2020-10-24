import 'package:entrega_app/app/widgets/wField.dart';
import 'package:entrega_app/services/configserver_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class Configuracoes extends StatefulWidget {
  @override
  _ConfiguracoesState createState() => _ConfiguracoesState();
}

class _ConfiguracoesState extends State<Configuracoes> {
  final iPController = TextEditingController();
  final portaController = TextEditingController();
  var _configServerService = GetIt.I.get<ConfigServerService>();

  _ConfiguracoesState();

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
    _configServerService.setIp = iPController.text;
  }

  Future<void> _setPortaFromSharedPref() async {
    _configServerService.setPort = portaController.text;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _carregarConfiguracoes();
    });
  }

  _carregarConfiguracoes() async {
    iPController.text = await _configServerService.getIp;
    portaController.text = await _configServerService.getPort;
  }
}
