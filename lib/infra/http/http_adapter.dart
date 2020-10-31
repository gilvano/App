import 'dart:convert';

import 'package:entrega_app/infra/cache/secure_cache_storage.dart';
import 'package:entrega_app/infra/http/http_client.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

class HttpAdapter implements HttpClient {
  final Client client;
  final SecureCacheStorage storage;

  HttpAdapter(this.client, this.storage);

  Future<dynamic> request(
      {@required String url,
      @required String method,
      Map body,
      Map headers}) async {
    final token = await storage.fetchSecure('token');
    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll({
        'content-type': 'application/json',
        'accept': 'application/json',
        'auth': token
      });
    final jsonBody = body != null ? jsonEncode(body) : null;
    var response = Response('', 500);
    Future<Response> futureResponse;
    try {
      if (method == 'post') {
        futureResponse =
            client.post(url, headers: defaultHeaders, body: jsonBody);
      } else if (method == 'get') {
        futureResponse = client.get(url, headers: defaultHeaders);
      } else if (method == 'delete') {
        futureResponse = client.delete(url, headers: defaultHeaders);
      } else if (method == 'patch') {
        futureResponse =
            client.patch(url, headers: defaultHeaders, body: jsonBody);
      }

      if (futureResponse != null) {
        response = await futureResponse.timeout(Duration(seconds: 30));
      }
    } catch (error) {
      throw error.toString();
    }
    return _handleResponse(response);
  }

  dynamic _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response.body.isEmpty ? null : jsonDecode(response.body);
      case 201:
        return response.body.isEmpty ? null : response.body;
      case 204:
        return response.body.isEmpty ? null : response.body;
      // case 400: throw HttpError.badRequest;
      // case 401: throw HttpError.unauthorized;
      // case 403: throw HttpError.forbidden;
      case 404:
        throw "Servidor não encontrado";
      default:
        throw ("${response.statusCode} : ${response.body}");
    }
  }
}
