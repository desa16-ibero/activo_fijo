import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/fixed_asset.dart';
import '../utils/network_util.dart';
import '../utils/var.dart';

class FixedAssetRest {
  final NetworkUtil _netUtil = NetworkUtil();

  Future<dynamic> getCatalog(BuildContext context) async {
    String? device = await Var.getIdentifier();

    Map<String, String>? headers = {
      'Content-Type': 'application/json',
      'token': Var.md5Hash(device),
      'id_dispositivo': device as String,
      'num_cia': Var.user!.profileID == 24 ? '100' : '200',
    };

    final uri =
        Uri.https(Var.urlServer, '/rest/apiaf_controller/APIAF/getInfo');

    debugPrint(uri.toString());
    debugPrint(headers.toString());

    if (Var.devMode) {
      final String response =
          await rootBundle.loadString('assets/json/catalog.json');
      final data = await json.decode(response);

      return data;
    } else {
      if (context.mounted) {
        return _netUtil.get(context, uri, headers: headers);
      } else {
        return null;
      }
    }
  }

  Future<dynamic> sendFixedAsset(
      BuildContext context, FixedAsset fixedAsset) async {
    String? device = await Var.getIdentifier();

    Map<String, String>? headers = {
      'Content-Type': 'multipart/form-data',
      'token': Var.md5Hash(device),
      'id_dispositivo': device as String,
    };

    final uri = Uri.https(Var.urlServer, '/rest/apiaf_controller/APIAF/garch');

    var formData = FormData.fromMap({
      'img_firma': await MultipartFile.fromFile(
          fixedAsset.imgSignature as String,
          filename: 'signature.jpg'),
      'img_evidencia': fixedAsset.imgEvidence != ''
          ? await MultipartFile.fromFile(fixedAsset.imgEvidence as String,
              filename: 'evidence.jpg')
          : '',
      'id_solicitud': fixedAsset.idRequest,
      'num_activo_uia': fixedAsset.activeNumUia,
      'num_cia': Var.user!.profileID == 24 ? '100' : '200',
      'num_tipo': fixedAsset.typeNumber,
      'nom_firma': fixedAsset.name,
    });

    debugPrint(uri.toString());
    debugPrint(headers.toString());

    if (Var.devMode) {
      return {'EXITO': true, 'MENSAJE': 'Guardado'};
    } else {
      if (context.mounted) {
        return _netUtil.multipart(
            context: context, url: uri, formData: formData, headers: headers);
      } else {
        return null;
      }
    }
  }

  Future<dynamic> getPrivacyPolice(BuildContext context) async {
    final String response =
        await rootBundle.loadString('assets/text/privacy_police.txt');
    return response;
  }
}
