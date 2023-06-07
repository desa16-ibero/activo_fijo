import 'dart:io';

import 'package:cool_alert/cool_alert.dart';
import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import '../model/fixed_asset.dart';
import '../rest/Fixed_asset_rest.dart';
import '../utils/routes.dart';
import 'fixed_asset_service.dart';

class HomeService with ChangeNotifier {
  final FixedAssetRest _api = FixedAssetRest();
  bool isLoading = false;
  TextEditingController searchController = TextEditingController();
  Object? selectedOptionMenu = 0;
  String nameSearchTextEdit = 'Búsqueda por número UIA';

  List<FixedAsset> lstFixedAssets = [];
  List<FixedAsset> lstFixedAssetsFiltered = [];

  selectedPopUpMenuItem(int option, BuildContext context) async {
    switch (option) {
      case 0:
        getCatalog(context);
        break;
    }
  }

  getCatalog(BuildContext context) async {
    EasyLoading.show();
    isLoading = true;
    notifyListeners();
    await _api.getCatalog(context).then((dynamic lstResponse) async {
      lstFixedAssets = [];
      if (lstResponse != null) {
        if (lstResponse['EXITO']) {
          lstResponse['DATOS'].forEach((json) {
            FixedAsset fixedAsset = FixedAsset.fromJson(json);
            lstFixedAssets.add(fixedAsset);
          });
        }
      }
    }).catchError((Object error) {
      debugPrint(error.toString());
      CoolAlert.show(
        width:
            Platform.isWindows ? MediaQuery.of(context).size.width / 6 : null,
        context: context,
        type: CoolAlertType.error,
        text: error.toString(),
        title: 'Error',
        confirmBtnText: 'Cerrar',
        backgroundColor: Colors.red[900] as Color,
      );
    });
    EasyLoading.dismiss();
    isLoading = false;
    notifyListeners();
  }

  openFixedAsset(BuildContext context, FixedAsset fixedAsset) {
    var fixedAssetService =
        Provider.of<FixedAssetService>(context, listen: false);
    fixedAssetService.mapFixedAsset =
        FixedAsset.mapToFixedAssetScreen(fixedAsset);
    fixedAssetService.fixedAsset = fixedAsset;
    Navigator.of(context)
        .pushNamedAndRemoveUntil(RoutePaths.fixedAsset, (route) => false);
  }

  onSearchTextChanged(String text) async {
    lstFixedAssetsFiltered.clear();
    if (text.isEmpty) {
      notifyListeners();
      return;
    }

    for (FixedAsset fixedAsset in lstFixedAssets) {
      switch (selectedOptionMenu) {
        case 0:
          if (removeDiacritics(fixedAsset.activeNumUia.toLowerCase().trim())
              .contains(removeDiacritics(text.toLowerCase().trim()))) {
            lstFixedAssetsFiltered.add(fixedAsset);
          }
          break;
        case 1:
          if (fixedAsset.serie
              .toString()
              .toLowerCase()
              .trim()
              .contains(text.toLowerCase().trim())) {
            lstFixedAssetsFiltered.add(fixedAsset);
          }

          break;
        case 2:
          if (fixedAsset.brand
              .toLowerCase()
              .trim()
              .contains(text.toLowerCase().trim())) {
            lstFixedAssetsFiltered.add(fixedAsset);
          }
          break;
        case 3:
          if (fixedAsset.model
              .toLowerCase()
              .trim()
              .contains(text.toLowerCase().trim())) {
            lstFixedAssetsFiltered.add(fixedAsset);
          }
          break;
      }
    }
    notifyListeners();
  }

  setSelectedRadio(Object? val, BuildContext context) {
    selectedOptionMenu = val;
    switch (val) {
      case 0:
        nameSearchTextEdit = 'Búsqueda por número UIA';
        break;
      case 1:
        nameSearchTextEdit = 'Búsqueda por serie';
        break;
      case 2:
        nameSearchTextEdit = 'Búsqueda por marca';
        break;
      case 3:
        nameSearchTextEdit = 'Búsqueda por modelo';
        break;
    }
    Navigator.pop(context);
    notifyListeners();
  }
}
