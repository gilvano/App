import 'package:entrega_app/services/configserver_service.dart';
import 'package:entrega_app/shared/constants.dart';
import 'package:get_it/get_it.dart';

Future<String> makeApiUrl(String path) async {
  var _configServerService = GetIt.I.get<ConfigServerService>();
  final _ip = await _configServerService.getIp;
  final _porta = await _configServerService.getPort;

  if (_ip.isEmpty || _porta.isEmpty) {
    return '$BASE_URL$path';
  } else {
    final _urlBase = 'http://$_ip:$_porta';
    print('$_urlBase$path');
    return '$_urlBase$path';
  }
}
