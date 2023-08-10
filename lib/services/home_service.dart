import 'dart:io';

import 'package:cool_alert/cool_alert.dart';
import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../model/fixed_asset.dart';
import '../rest/Fixed_asset_rest.dart';
import '../ui/home/privacy_police_screen.dart';
import '../utils/var.dart';
import '../widgets/full_screen_dialog.dart';
import 'fixed_asset_service.dart';

class HomeService with ChangeNotifier {
  final FixedAssetRest _api = FixedAssetRest();
  bool isLoading = false;
  TextEditingController searchController = TextEditingController();
  Object? selectedOptionMenu = 0;
  String nameSearchTextEdit = 'Búsqueda por número UIA';

  List<FixedAsset> lstFixedAssets = [];
  List<FixedAsset> lstFixedAssetsFiltered = [];

  String privacyPolice = '';

  _showDismissLoader(bool show) {
    isLoading = show;
    notifyListeners();
    show ? EasyLoading.show() : EasyLoading.dismiss();
  }

  _showError(BuildContext context, String error) {
    _showDismissLoader(false);
    debugPrint(error);
    CoolAlert.show(
      width: Platform.isWindows ? MediaQuery.of(context).size.width / 6 : null,
      context: context,
      type: CoolAlertType.error,
      text: error.toString(),
      title: 'Error',
      confirmBtnText: 'Cerrar',
      backgroundColor: Colors.red[900] as Color,
    );
  }

  selectedPopUpMenuItem(int option, BuildContext context) async {
    switch (option) {
      case 0:
        getCatalog(context);
        break;
      case 1:
        CoolAlert.show(
          width:
              Platform.isWindows ? MediaQuery.of(context).size.width / 6 : null,
          context: context,
          barrierDismissible: false,
          type: CoolAlertType.confirm,
          text: 'Estas apunto de cerrar sesión.\n ¿Deseas continuar?',
          title: 'Atención',
          confirmBtnText: 'Continuar',
          cancelBtnText: 'Cancelar',
          backgroundColor: Colors.blue[900] as Color,
          onConfirmBtnTap: () => _deleteUser(context),
        );
        break;
    }
  }

  _deleteUser(BuildContext context) {
    Var.box.delete(CollectionsDB.user.name);
    context.pushReplacement('/login');
  }

  getCatalog(BuildContext context) async {
    _showDismissLoader(true);
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
    }).catchError((Object error) => _showError(context, error.toString()));
    _showDismissLoader(false);
  }

  getPrivacyPolice(BuildContext context) async {
    _showDismissLoader(true);
    privacyPolice = '';
    await _api.getPrivacyPolice(context).then((dynamic response) async {
      privacyPolice = response;
    }).catchError((Object error) => _showError(context, error.toString()));
    _showDismissLoader(false);
  }

  bool iAgree = false;

  onChanged(bool value) {
    iAgree = value;
    notifyListeners();
  }

  openPrivacyPolice(BuildContext context, FixedAsset fixedAsset) {
    iAgree = false;
    FullScreenDialog().fullScreenDialog(context,
        PrivacyPoliceScreen(fixedAsset: fixedAsset), 'Aviso de privacidad');
  }

  openFixedAsset(BuildContext context, FixedAsset fixedAsset) {
    var fixedAssetService =
        Provider.of<FixedAssetService>(context, listen: false);
    fixedAssetService.mapFixedAsset =
        FixedAsset.mapToFixedAssetScreen(fixedAsset);
    fixedAssetService.fixedAsset = fixedAsset;

    context.pushReplacement('/home/fixedAsset');
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
