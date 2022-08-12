import 'dart:io';
import 'dart:typed_data';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/fixed_asset_service.dart';
import '../../utils/custom_colors.dart';
import '../../utils/routes.dart';
import '../../utils/var.dart';
import '../../widgets/custom_title.dart';
import '../../widgets/popup_menu_item.dart';

class FixedAssetScreen extends StatefulWidget {
  const FixedAssetScreen({Key? key}) : super(key: key);

  @override
  State<FixedAssetScreen> createState() => _FixedAssetScreenState();
}

class _FixedAssetScreenState extends State<FixedAssetScreen> {
  late FixedAssetService _fixedAssetService;

  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    _fixedAssetService.back(context);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    _fixedAssetService = Provider.of<FixedAssetService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activo fijo seleccionado'),
        leading: GestureDetector(
          onTap: () => _fixedAssetService.back(context),
          child: const Icon(Icons.arrow_back_rounded),
        ),
        actions: [
          Theme(
            data: Theme.of(context).copyWith(
                textTheme: const TextTheme().apply(bodyColor: Colors.black),
                dividerColor: Colors.white,
                iconTheme: const IconThemeData(color: Colors.white)),
            child: PopupMenuButton<int>(
              color: CustomColors.dartMainColor,
              itemBuilder: (context) => [
                PopUpMenuItem.createPopUpMenuItem('Guardar', 0, Icons.save),
              ],
              onSelected: (item) =>
                  _fixedAssetService.selectedPopUpMenuItem(item, context),
            ),
          ),
        ],
      ),
      body: AbsorbPointer(
        absorbing: _fixedAssetService.isLoading,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomTitle(title: 'Resumen'),
              _fixedAssetService.makeTable(_fixedAssetService.mapFixedAsset),
              const CustomTitle(title: 'Nombre'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _fixedAssetService.nameController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(),
                    ), //fillColor: Colors.green
                  ),
                  onEditingComplete: () => FocusScope.of(context).nextFocus(),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Debes ingresar este campo';
                    }
                    return null;
                  },
                ),
              ),
              ElevatedButton(
                style: Var.raisedButtonStyle,
                onPressed: () => _fixedAssetService.openSignature(context),
                child: const Text('Firmar'),
              ),
              if (_fixedAssetService.signatureBytes != null &&
                  _fixedAssetService.showSignature)
                Image.memory(
                  _fixedAssetService.signatureBytes as Uint8List,
                  fit: BoxFit.cover,
                ),
              ElevatedButton(
                style: Var.raisedButtonStyle,
                onPressed: () => _fixedAssetService.openCamera(context),
                child: const Text('Tomar fotografía'),
              ),
              _fixedAssetService.evidence.isNotEmpty
                  ? _customPicture(_fixedAssetService.evidence)
                  : Container()
            ],
          ),
        ),
      ),
    );
  }

  Widget _customPicture(String path) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(
        children: [
          Image.file(File(path)),
          Positioned.fill(
            child: Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                child: const Icon(
                  Icons.delete_rounded,
                  size: 40,
                  color: CustomColors.dartMainColor,
                ),
                onTap: () => _fixedAssetService.deletePhoto(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
