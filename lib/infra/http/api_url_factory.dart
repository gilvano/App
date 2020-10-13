import 'package:entrega_app/services/configserver_service.dart';
import 'package:entrega_app/shared/constants.dart';
import 'package:get_it/get_it.dart';

String makeApiUrl(String path) {
  var _configServerService = GetIt.I.get<ConfigServerService>();
  final _ip = _configServerService.getIp;
  final _porta = _configServerService.getPort;

  if (_ip.isEmpty || _porta.isEmpty) {
    return '$BASE_URL$path';
  } else {
    final _urlBase = 'http://$_ip:$_porta';
    print('$_urlBase$path');
    return '$_urlBase$path';
  }
}
