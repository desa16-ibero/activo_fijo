import 'dart:convert';

import 'package:cool_alert/cool_alert.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetworkUtil {
  NetworkUtil.internal();

  factory NetworkUtil() => NetworkUtil.internal();

  final JsonDecoder _decoder = const JsonDecoder();

  Future<dynamic> get(BuildContext context, Uri url, {headers}) {
    return http.get(url, headers: headers).then((http.Response response) {
      final String body = response.body;
      final int statusCode = response.statusCode;

      final resp = _decoder.convert(body);

      if (statusCode < 200 || statusCode >= 400) {
        CoolAlert.show(
            context: context,
            barrierDismissible: false,
            type: CoolAlertType.warning,
            text: 'Ocurrio un error al obtener la información',
            title: 'Alerta',
            confirmBtnText: 'Cerrar',
            backgroundColor: Colors.yellow[800] as Color);
        return null;
      }
      return resp;
    });
  }

  Future<dynamic> post(BuildContext context, Uri url,
      {headers, body, encoding}) {
    return http
        .post(url,
            headers: headers as Map<String, String>?,
            body: jsonEncode(body),
            encoding: encoding)
        .then((http.Response response) {
      final String body = response.body;
      final int statusCode = response.statusCode;

      final resp = _decoder.convert(body);

      if (statusCode < 200 || statusCode >= 400) {
        CoolAlert.show(
            context: context,
            barrierDismissible: false,
            type: CoolAlertType.warning,
            text: 'Ocurrio un error al enviar la información',
            title: 'Alerta',
            confirmBtnText: 'Cerrar',
            backgroundColor: Colors.yellow[800] as Color);
        return null;
      }
      return resp;
    });
  }

  Future<dynamic> put(BuildContext context, Uri url,
      {headers, body, encoding}) {
    return http
        .put(url, headers: headers, body: jsonEncode(body), encoding: encoding)
        .then((http.Response response) {
      final String body = response.body;
      final int statusCode = response.statusCode;

      final resp = _decoder.convert(body);

      if (statusCode < 200 || statusCode >= 400) {
        CoolAlert.show(
            context: context,
            barrierDismissible: false,
            type: CoolAlertType.warning,
            text: 'Ocurrio un error al actualizar la información',
            title: 'Alerta',
            confirmBtnText: 'Cerrar',
            backgroundColor: Colors.yellow[800] as Color);
        return null;
      }
      return resp;
    });
  }

  Future<dynamic> delete(BuildContext context, Uri url,
      {headers, body, encoding}) {
    return http
        .delete(url,
            headers: headers, body: jsonEncode(body), encoding: encoding)
        .then((http.Response response) {
      final String body = response.body;
      final int statusCode = response.statusCode;

      final resp = _decoder.convert(body);

      if (statusCode < 200 || statusCode >= 400) {
        CoolAlert.show(
            context: context,
            barrierDismissible: false,
            type: CoolAlertType.warning,
            text: 'Ocurrio un eliminar al enviar la información',
            title: 'Alerta',
            confirmBtnText: 'Cerrar',
            backgroundColor: Colors.yellow[800] as Color);
        return null;
      }
      return resp;
    });
  }

  Future<dynamic> multipart(
      {required BuildContext context,
      Map<String, dynamic>? headers,
      required Uri url,
      required FormData formData}) async {
    var response = await Dio().post(url.toString(),
        data: formData, options: Options(headers: headers));

    return response.data;
  }
}
