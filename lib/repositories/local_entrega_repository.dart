import 'package:entrega_app/infra/http/api_url_factory.dart';
import 'package:entrega_app/infra/http/http_client.dart';
import 'package:entrega_app/models/local_entrega_model.dart';

class LocalEntregaRepository {
  LocalEntregaRepository(this.client);

  final HttpClient client;
  List<LocalEntregaModel> locais;

  Future<List<LocalEntregaModel>> getAll() async {
    try {
      final _url = await makeApiUrl("/localentrega");
      var response = await client.request(url: _url, method: 'get');
      // print(response);
      locais = List.from(
          response.map((local) => LocalEntregaModel.fromJson(local)).toList());
    } catch (e) {
      throw (e.toString());
    }
    return locais;
  }

  Future<void> saveLocalEntrega(Map<String, String> data) async {
    try {
      final _url = await makeApiUrl("/localentrega");
      var response =
          await client.request(url: _url, method: 'post', body: data);
      // print(response.toString());
    } catch (e) {
      throw (e.toString());
    }
  }

  Future<void> editLocalEntrega(LocalEntregaModel localEntregaModel) async {
    try {
      final _url =
          await makeApiUrl('/localentrega/' + localEntregaModel.id.toString());
      var response = await client.request(url: _url, method: 'patch', body: {
        "descricao": localEntregaModel.descricao,
      });
      // print(response);
    } catch (e) {
      throw (e.toString());
    }
  }

  Future<void> deleteLocalEntrega(LocalEntregaModel localEntregaModel) async {
    try {
      final _url =
          await makeApiUrl('/localentrega/' + localEntregaModel.id.toString());
      var response = await client.request(url: _url, method: 'delete');
      // print(response);
    } catch (e) {
      throw (e.toString());
    }
  }
}
