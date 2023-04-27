import 'package:flutter/cupertino.dart';

import '../utils/network_util.dart';
import '../utils/var.dart';

class LoginRest {
  final NetworkUtil _netUtil = NetworkUtil();

  Future<dynamic> login(
      BuildContext context, String account, String password, String typeUSer) {
    Map<String, String> queryParameters = {
      'wsdl': '',
      'method': 'validaLogin',
      'tipo': typeUSer,
      'cuenta': account.trim(),
      'clave': Var.encryptedString(password.trim()),
      'usrauth': 'c9f1b784d96fb088cd42d5641b1d74f4',
      'returnFormat': 'Json',
    };
    var uri = Uri.https(
        Var.urlServerLogin, '/ws/WSServiciosIbero.cfc', queryParameters);
    debugPrint(uri.toString());

    return _netUtil.get(context, uri).then((response) {
      return response;
    });
  }
}
