import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/login_service.dart';
import '../../utils/custom_colors.dart';
import '../../utils/var.dart';
import '../../widgets/custom_dropdownbutton.dart';
import '../../widgets/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late LoginService service;

  @override
  Widget build(BuildContext context) {
    service = Provider.of<LoginService>(context);

    return AbsorbPointer(
      absorbing: service.isLoading,
      child: WillPopScope(
        onWillPop: () => service.onWillPop(context),
        child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          body: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: Center(
              child: SingleChildScrollView(
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    if (constraints.maxWidth > Var.maxWidth) {
                      return _makeContent(formKey, service, context, false);
                    } else {
                      return _makeContent(formKey, service, context, true);
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _makeContent(GlobalKey<FormState> formKey, LoginService service,
      BuildContext context, bool isMobile) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : MediaQuery.of(context).size.width / 4),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/icon_app.png',
                    alignment: Alignment.topCenter,
                    fit: BoxFit.scaleDown,
                    height: 128,
                  ),
                  const Text('Control vehicular'),
                ],
              ),
              const SizedBox(height: 25),
              CustomDropDownButton(
                dropdownItems: service.mapProfilesApp,
                selectedValue: service.selectedProfile,
                onChanged: (String? value) =>
                    service.changeOptionDropDown(value),
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                hint: service.mTFFLoginUser['user']!.hint,
                validators: service.mTFFLoginUser['user']!.validations,
                textInputType: service.mTFFLoginUser['user']!.inputType,
                onChanged: (String value) =>
                    service.onUpdateTextFormField('user', value),
                initialValue: service.mTFFLoginUser['user']!.value,
                isTFFLogin: false,
                isLastTFF: false,
              ),
              CustomTextFormField(
                hint: service.mTFFLoginUser['password']!.hint,
                validators: service.mTFFLoginUser['password']!.validations,
                textInputType: service.mTFFLoginUser['password']!.inputType,
                onChanged: (String value) =>
                    service.onUpdateTextFormField('password', value),
                initialValue: service.mTFFLoginUser['password']!.value,
                isTFFLogin: false,
                obscureText: service.mTFFLoginUser['password']!.obscureText,
                isLastTFF: true,
                changeObscureText: () => service.changeObscureText('password'),
                send: () => service.submit(context, formKey),
              ),
              const SizedBox(height: 25),
              SwitchListTile(
                value: service.saveSession,
                activeColor: Colors.white,
                activeTrackColor: CustomColors.dartMainColor,
                onChanged: service.onSaveSession,
                title: const Text('Recordar datos'),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                style: Var.raisedButtonStyle,
                onPressed: () => service.submit(context, formKey),
                child: const Text('Iniciar sesión'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
