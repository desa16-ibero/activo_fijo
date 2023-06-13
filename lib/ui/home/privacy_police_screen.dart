import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/fixed_asset.dart';
import '../../services/home_service.dart';
import '../../utils/custom_colors.dart';
import '../../utils/var.dart';

class PrivacyPoliceScreen extends StatefulWidget {
  final FixedAsset fixedAsset;

  const PrivacyPoliceScreen({Key? key, required this.fixedAsset})
      : super(key: key);

  @override
  State<PrivacyPoliceScreen> createState() => _PrivacyPoliceScreenState();
}

class _PrivacyPoliceScreenState extends State<PrivacyPoliceScreen> {
  late HomeService service;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      service.getPrivacyPolice(context);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    service = Provider.of<HomeService>(context);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > Var.maxWidth) {
            return _content(true);
          } else {
            return _content(false);
          }
        },
      ),
    );
  }

  Widget _content(bool isNotMobile) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isNotMobile ? MediaQuery.of(context).size.width / 4 : 0,
      ),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    service.privacyPolice,
                    textAlign: TextAlign.justify,
                  ),
                  SwitchListTile(
                    value: service.iAgree,
                    activeColor: Colors.white,
                    activeTrackColor: CustomColors.dartMainColor,
                    onChanged: service.onChanged,
                    title: const Text(
                        'He leído y acepto la política de privacidad'),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: ElevatedButton(
                  style: Var.raisedButtonStyle,
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Rechazar'),
                ),
              ),
              Expanded(flex: 1, child: Container()),
              Expanded(
                flex: 3,
                child: ElevatedButton(
                  style: Var.raisedButtonStyle,
                  onPressed: service.iAgree
                      ? () => service.openFixedAsset(context, widget.fixedAsset)
                      : null,
                  child: const Text('Continuar'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
