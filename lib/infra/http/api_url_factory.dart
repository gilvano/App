import 'package:entrega_app/infra/configServer.dart';
import 'package:entrega_app/shared/constants.dart';

String makeApiUrl(String path, ConfigServer configServer) {
  final _ip = configServer.getIp;
  final _porta = configServer.getPort;
  if (_ip.isEmpty || _porta.isEmpty) {
    return '$BASE_URL$path';
  } else {
    final _urlBase = 'http://$_ip:$_porta';
    print('$_urlBase$path');
    return '$_urlBase$path';    
  }
}
