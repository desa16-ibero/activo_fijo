import 'dart:io';

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';

import '../model/custom_model.dart';
import '../model/user.dart';
import '../rest/login_rest.dart';
import '../utils/var.dart';

class LoginService with ChangeNotifier {
  final LoginRest _api = LoginRest();
  bool isLoading = false;

  Map<String, ItemTextFormField> mTFFLoginUser = User.mTFFLoginUser;
  Map<String, String> mapProfilesApp = User.mapProfilesApp;
  String? selectedProfile = '24';

  bool showDig = false;
  bool saveSession = true;

  LoginService();

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

  onSaveSession(bool value) {
    saveSession = value;
    notifyListeners();
  }

  changeOptionDropDown(String? newValue) {
    selectedProfile = newValue;
    notifyListeners();
  }

  changeObscureText(String key) {
    mTFFLoginUser.update(key, (value) {
      value.obscureText = !value.obscureText!;
      return value;
    });
    notifyListeners();
  }

  onUpdateTextFormField(String key, String val) async {
    mTFFLoginUser.update(key, (value) {
      value.value = val;
      return value;
    });
  }

  submit(BuildContext context, GlobalKey<FormState> formKey) async {
    final form = formKey.currentState;
    if (form!.validate()) {
      _showDismissLoader(true);
      await _login(context, mTFFLoginUser['user']!.value.trim(),
          mTFFLoginUser['password']!.value.trim(), selectedProfile!);
      _showDismissLoader(false);
    }
  }

  _login(BuildContext context, String account, String password,
      String typeUSer) async {
    await _api
        .login(context, account, password, typeUSer)
        .then((dynamic lstResponse) async {
      if (lstResponse != null) {
        if (lstResponse[0]['RESULTADO'] == '1') {
          User user = User(
              account: int.parse(account),
              password: password,
              name:
                  '${lstResponse[0]['NOMBRE']} ${lstResponse[0]['APELLIDO_PATERNO']} ${lstResponse[0]['APELLIDO_MATERNO']},',
              hashKiosk: lstResponse[0]['DESCRIPCION'],
              saveSession: saveSession,
              profileID: int.parse(selectedProfile!),
              profile: mapProfilesApp.entries
                  .firstWhere((element) => element.key == selectedProfile)
                  .value,
              lastUpdatePassword: DateTime.now());
          Var.box.put(CollectionsDB.user.name, user);
          Var.user = user;
          context.pushReplacement('/home');
        } else {
          CoolAlert.show(
              width: Platform.isWindows
                  ? MediaQuery.of(context).size.width / 6
                  : null,
              context: context,
              barrierDismissible: false,
              type: CoolAlertType.warning,
              text: lstResponse[0]['DESCRIPCION'],
              title: 'Alerta',
              confirmBtnText: 'Cerrar',
              backgroundColor: Colors.yellow[800] as Color);
        }
      }
    }).catchError((Object error) => _showError(context, error.toString()));
  }

  Future<bool> onWillPop(BuildContext context) async {
    bool? exitResult = await CoolAlert.show(
        width:
            Platform.isWindows ? MediaQuery.of(context).size.width / 6 : null,
        context: context,
        type: CoolAlertType.confirm,
        text: '¿Deseas salir de la aplicación?',
        title: 'Saliendo...',
        confirmBtnText: 'Salir',
        cancelBtnText: 'Cancelar',
        backgroundColor: Colors.blue[900] as Color,
        onConfirmBtnTap: () => Navigator.of(context).pop(true));

    return exitResult ?? false;
  }
}
