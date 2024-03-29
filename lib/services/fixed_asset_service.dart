import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cool_alert/cool_alert.dart';
import 'package:easy_signature_pad/easy_signature_pad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:image/image.dart' as image_convert;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

import '../model/fixed_asset.dart';
import '../rest/Fixed_asset_rest.dart';
import '../utils/var.dart';
import '../widgets/custom_dialog.dart';
import '../widgets/custom_single_table.dart';
import '../widgets/custom_title.dart';

class FixedAssetService with ChangeNotifier {
  final FixedAssetRest _api = FixedAssetRest();

  bool isLoading = false;

  late FixedAsset fixedAsset;

  late Map<String, dynamic> mapFixedAsset;

  TextEditingController nameController = TextEditingController();

  Uint8List? signatureBytes;
  bool showSignature = false;

  final ImagePicker _picker = ImagePicker();

  String evidence = '';

  Uint8List? imageScreenshot;
  ScreenshotController screenshotController = ScreenshotController();

  FixedAssetService();

  Widget makeTable(Map<String, dynamic> mapFixedAsset) {
    return Column(
      children: mapFixedAsset.entries
          .map((fixedAsset) => CustomSingleTable(
                value: fixedAsset.value,
                title: fixedAsset.key,
              ))
          .toList(),
    );
  }

  selectedPopUpMenuItem(int option, BuildContext context) async {
    switch (option) {
      case 0:
        makeScreenshot(context);
        break;
    }
  }

  _setImage(String bytes) async {
    if (bytes.isNotEmpty) {
      Uint8List convertedBytes = base64Decode(bytes);
      signatureBytes = convertedBytes;
    } else {
      signatureBytes = null;
    }
  }

  openCamera(BuildContext context) async {
    final XFile? photo;
    if (Platform.isWindows) {
      photo = await _picker.pickImage(source: ImageSource.gallery);
    } else {
      FocusManager.instance.primaryFocus?.unfocus();
      photo = await _picker.pickImage(source: ImageSource.camera);
    }
    if (photo != null) {
      evidence = photo.path;
      notifyListeners();
    }
  }

  deletePhoto() {
    evidence = '';
    notifyListeners();
  }

  openSignature(BuildContext context) {
    FocusScope.of(context).unfocus();
    final size = MediaQuery.of(context).size;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: CustomDialog(
            isCustomDialog: true,
            textCancelButton: 'Cancelar',
            textOkButton: 'Guardar',
            onConfirmBtnTap: () {
              showSignature = true;
              Navigator.pop(context);
              notifyListeners();
            },
            onCancelBtnTap: () {
              Navigator.pop(context);
              signatureBytes = null;
              showSignature = false;
              notifyListeners();
            },
            content: Container(
              width: size.width,
              color: Colors.grey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      if (constraints.maxWidth > Var.maxWidth) {
                        return _signaturePad(size, true);
                      } else {
                        return _signaturePad(size, false);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _signaturePad(Size size, bool isNotMobile) {
    return EasySignaturePad(
      onChanged: (image) => _setImage(image),
      height: size.width ~/ (isNotMobile ? 3 : 1.5),
      width: size.width ~/ 1,
      penColor: Colors.black,
      strokeWidth: 1.0,
      borderRadius: 10.0,
      borderColor: Colors.white,
      backgroundColor: Colors.white,
      transparentImage: false,
      transparentSignaturePad: false,
      hideClearSignatureIcon: false,
    );
  }

  makeScreenshot(BuildContext context) {
    if (nameController.text.isNotEmpty && signatureBytes != null) {
      EasyLoading.show();
      double pixelRatio = MediaQuery.of(context).devicePixelRatio;

      screenshotController
          .captureFromWidget(
              Container(
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CustomTitle(title: 'Resumen'),
                    makeTable(mapFixedAsset),
                    const CustomTitle(title: 'Nombre'),
                    Text(
                      nameController.text,
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    const CustomTitle(title: 'Firma'),
                    Image.memory(
                      signatureBytes as Uint8List,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              pixelRatio: pixelRatio,
              delay: const Duration(milliseconds: 10))
          .then((capturedImage) async {
        final tempDir = await getTemporaryDirectory();
        File fileSignature = await File(
                '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch.toString()}.png')
            .create();
        fileSignature.writeAsBytesSync(capturedImage);

        final image =
            image_convert.decodeImage(fileSignature.readAsBytesSync())!;
        File fileSignatureJPG = await File(
                '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch.toString()}.jpg')
            .create();
        fileSignatureJPG.writeAsBytesSync(image_convert.encodeJpg(image));

        String pathEvidence = evidence.isNotEmpty ? File(evidence).path : '';
        fixedAsset = fixedAsset.copyWith(
            imgEvidence: pathEvidence,
            imgSignature: fileSignatureJPG.path,
            name: nameController.text);
        debugPrint(pathEvidence);
        if (context.mounted) _sendFixedAsset(context, fixedAsset);
      });
    } else {
      CoolAlert.show(
          width:
              Platform.isWindows ? MediaQuery.of(context).size.width / 6 : null,
          context: context,
          barrierDismissible: false,
          type: CoolAlertType.warning,
          text: 'El nombre y la firma son abligatorios.',
          title: 'Alerta',
          confirmBtnText: 'Cerrar',
          backgroundColor: Colors.yellow[800] as Color);
    }
  }

  _sendFixedAsset(BuildContext context, FixedAsset fixedAsset) async {
    await _api
        .sendFixedAsset(context, fixedAsset)
        .then((dynamic lstResponse) async {
      if (lstResponse != null) {
        if (lstResponse['EXITO']) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return WillPopScope(
                onWillPop: () async => false,
                child: CustomDialog(
                  iconEvent: Icons.done,
                  background: Colors.green[800] as Color,
                  message: 'Se envió correctamente.',
                  title: 'Éxito',
                  textOkButton: 'Continuar',
                  onConfirmBtnTap: () {
                    cleanFixedAsset();
                    context.pushReplacement('/home');
                  },
                  isCustomDialog: false,
                ),
              );
            },
          );
        } else {
          CoolAlert.show(
              width: Platform.isWindows
                  ? MediaQuery.of(context).size.width / 6
                  : null,
              context: context,
              barrierDismissible: false,
              type: CoolAlertType.warning,
              text: lstResponse['MENSAJE'],
              title: 'Alerta',
              confirmBtnText: 'Cerrar',
              backgroundColor: Colors.yellow[800] as Color);
        }
      }
    }).catchError((Object error) {
      debugPrint(error.toString());
      CoolAlert.show(
        width:
            Platform.isWindows ? MediaQuery.of(context).size.width / 6 : null,
        context: context,
        type: CoolAlertType.error,
        text: 'Hubó un error al enviar el activo fijo.',
        title: 'Error',
        confirmBtnText: 'Cerrar',
        backgroundColor: Colors.red[900] as Color,
      );
    });
    EasyLoading.dismiss();
  }

  cleanFixedAsset() {
    nameController.clear();
    signatureBytes = null;
    showSignature = false;
    evidence = '';
  }

  back(BuildContext context) {
    if (nameController.text.isNotEmpty || showSignature) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext contextTemp) {
          return WillPopScope(
            onWillPop: () async => false,
            child: CustomDialog(
              iconEvent: Icons.question_mark,
              background: Colors.blue[800] as Color,
              message:
                  'Estas a punto de salir y se perderan los cambios que no se hallan enviado.\n¿Deseas salir? ',
              title: 'Atención',
              textOkButton: 'Continuar',
              textCancelButton: 'Cancelar',
              onConfirmBtnTap: () {
                cleanFixedAsset();
                context.pushReplacement('/home');
              },
              isCustomDialog: false,
            ),
          );
        },
      );
    } else {
      context.pushReplacement('/home');
    }
  }

/*Future<dynamic> showCapturedWidget(
      BuildContext context, Uint8List capturedImage) {
    EasyLoading.dismiss();
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: CustomDialog(
            textCancelButton: 'Cacelar',
            textOkButton: 'Guardar',
            onConfirmBtnTap: () {
              Navigator.pop(context);
            },
            onCancelBtnTap: () {
              Navigator.pop(context);
            },
            content: Image.memory(
              capturedImage,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }*/
}
